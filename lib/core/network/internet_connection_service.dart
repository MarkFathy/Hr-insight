import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

/// Network connection states.
enum NetworkState { checking, connected, unstable, disconnected }

/// Underlying reason for network failure or instability.
enum NetworkIssue { none, noInterface, noInternet, captivePortal }

/// Public contract for internet reachability and stability monitoring.
abstract interface class IInternetConnectionService {
  /// Stream emitting network state transitions.
  Stream<NetworkState> get stateStream;

  /// Stream firing strictly when recovering from [NetworkState.disconnected] to [NetworkState.connected].
  Stream<void> get connectivityRestoredStream;

  /// Returns true if device currently has active reachability.
  Future<bool> hasConnection();

  /// Forces an immediate network consensus check.
  Future<void> checkNow();

  /// The most recently evaluated network state.
  NetworkState get currentState;

  /// The root cause of the last network issue.
  NetworkIssue get lastIssue;

  /// Whether current connection is fully verified and stable.
  bool get isStable;

  /// Reports HTTP round-trip latency in milliseconds.
  void reportLatency(int ms);

  /// Reports a network timeout or connection error.
  void reportRequestFailure();

  /// Releases resources, timers, and stream controllers.
  void dispose();
}

/// System-wide thresholds and configuration constants.
class NetworkConfig {
  const NetworkConfig._();

  static const int pingIntervalSeconds = 5;
  static const List<int> recoveryBackoffSeconds = [2, 4, 6, 10, 15];
  static const int slowPingThresholdMs = 700;
  static const int slowDioThresholdMs = 2800;
  static const int maxSlowHits = 3;
  static const Duration slowHttpDecay = Duration(seconds: 30);
  static const int failuresBeforeDisconnect = 2;
  static const int requiredProbeSuccesses = 2;
  static const Duration probeTimeout = Duration(seconds: 4);
  static const Duration failureCheckDebounce = Duration(seconds: 3);
}

/// Target endpoint used for reachability and captive portal detection.
class ProbeTarget {
  const ProbeTarget(this.uri, this.isValid);

  final Uri uri;
  final bool Function(int statusCode, String body) isValid;
}

/// Internal classification of single probe outcome.
enum ProbeOutcome { ok, portal, failed }

/// Result of a single endpoint probe.
class ProbeResult {
  const ProbeResult.ok(this.latencyMs) : outcome = ProbeOutcome.ok;

  const ProbeResult.portal() : outcome = ProbeOutcome.portal, latencyMs = null;

  const ProbeResult.failed() : outcome = ProbeOutcome.failed, latencyMs = null;

  final ProbeOutcome outcome;
  final int? latencyMs;

  bool get isOk => outcome == ProbeOutcome.ok;
  bool get isPortal => outcome == ProbeOutcome.portal;
  bool get isFailed => outcome == ProbeOutcome.failed;
}

/// Consolidated multi-endpoint probe consensus summary.
class ProbeSummary {
  const ProbeSummary({
    required this.isSuccess,
    required this.issue,
    required this.results,
    this.latencyMs,
  });

  final bool isSuccess;
  final int? latencyMs;
  final NetworkIssue issue;
  final List<ProbeResult> results;
}

/// Multi-endpoint HTTPS reachability and captive portal probe.
class ReachabilityProbe {
  ReachabilityProbe({
    List<ProbeTarget>? targets,
    HttpClient? httpClient,
    this.timeout = NetworkConfig.probeTimeout,
    this.requiredSuccesses = NetworkConfig.requiredProbeSuccesses,
  }) : targets = List<ProbeTarget>.unmodifiable(targets ?? defaultTargets),
       _client = httpClient ?? _createDefaultClient(timeout);

  static final List<ProbeTarget> defaultTargets = [
    ProbeTarget(
      Uri.parse('https://cp.cloudflare.com/generate_204'),
      (statusCode, body) => statusCode == 204,
    ),
    ProbeTarget(
      Uri.parse('https://www.gstatic.com/generate_204'),
      (statusCode, body) => statusCode == 204,
    ),
    ProbeTarget(
      Uri.parse('https://captive.apple.com/hotspot-detect.html'),
      (statusCode, body) => statusCode == 200 && body.contains('Success'),
    ),
  ];

  static HttpClient _createDefaultClient(Duration timeout) => HttpClient()
    ..connectionTimeout = timeout
    ..idleTimeout = const Duration(seconds: 30)
    ..userAgent = 'App-ReachabilityProbe/1.0';

  final List<ProbeTarget> targets;
  final HttpClient _client;
  final Duration timeout;
  final int requiredSuccesses;

  int _primaryIndex = 0;
  int get primaryIndex => _primaryIndex;

  static const int _maxBodyBytes = 4096;

  /// Runs probe against a single target.
  Future<ProbeResult> run(ProbeTarget target) async {
    final sw = Stopwatch()..start();
    HttpClientRequest? request;
    try {
      request = (await _client.getUrl(target.uri).timeout(timeout))
        ..followRedirects = false
        ..headers.set(HttpHeaders.cacheControlHeader, 'no-cache');

      final response = await request.close().timeout(timeout);
      sw.stop();
      final latencyMs = sw.elapsedMilliseconds;

      final bytes = <int>[];
      await for (final chunk in response.timeout(timeout)) {
        if (bytes.length < _maxBodyBytes) {
          final remaining = _maxBodyBytes - bytes.length;
          if (chunk.length <= remaining) {
            bytes.addAll(chunk);
          } else {
            bytes.addAll(chunk.take(remaining));
            break;
          }
        } else {
          break;
        }
      }

      final body = utf8.decode(bytes, allowMalformed: true);
      final statusCode = response.statusCode;

      if (statusCode >= 300 && statusCode < 400) {
        return const ProbeResult.portal();
      }
      if (target.isValid(statusCode, body)) {
        return ProbeResult.ok(latencyMs);
      }
      if (statusCode >= 200 && statusCode < 300) {
        return const ProbeResult.portal();
      }
      return const ProbeResult.failed();
    } on Object catch (_) {
      try {
        request?.abort();
      } on Object catch (_) {}
      return const ProbeResult.failed();
    }
  }

  /// Runs probe against the fastest cached primary target.
  Future<ProbeResult> runPrimary() async {
    if (targets.isEmpty) {
      return const ProbeResult.failed();
    }
    return run(targets[_primaryIndex.clamp(0, targets.length - 1)]);
  }

  /// Runs all probe targets concurrently and determines consensus.
  Future<ProbeSummary> runAll() async {
    final results = await Future.wait(targets.map(run));
    final okLatencies = <int>[];
    int? fastestIndex;
    int? fastestLatency;

    for (var i = 0; i < results.length; i++) {
      final r = results[i];
      if (r.isOk && r.latencyMs != null) {
        okLatencies.add(r.latencyMs!);
        if (fastestLatency == null || r.latencyMs! < fastestLatency) {
          fastestLatency = r.latencyMs;
          fastestIndex = i;
        }
      }
    }

    final needed = math.min(requiredSuccesses, targets.length);
    if (okLatencies.length >= needed) {
      if (fastestIndex != null) {
        _primaryIndex = fastestIndex;
      }
      okLatencies.sort();
      final medianLatency = okLatencies[okLatencies.length ~/ 2];
      return ProbeSummary(
        isSuccess: true,
        latencyMs: medianLatency,
        issue: NetworkIssue.none,
        results: results,
      );
    }

    final hasPortal = results.any((r) => r.isPortal);
    return ProbeSummary(
      isSuccess: false,
      issue: hasPortal ? NetworkIssue.captivePortal : NetworkIssue.noInternet,
      results: results,
    );
  }

  /// Closes the underlying HTTP client.
  void close() {
    _client.close(force: true);
  }
}

/// Production implementation of [IInternetConnectionService].
class InternetConnectionService
    with WidgetsBindingObserver
    implements IInternetConnectionService {
  InternetConnectionService({
    ReachabilityProbe? probe,
    Connectivity? connectivity,
    Future<int?> Function()? pingChecker,
    bool registerObserver = true,
  }) : _probe = probe ?? ReachabilityProbe(),
       _connectivity = connectivity ?? Connectivity(),
       _pingChecker = pingChecker {
    if (registerObserver) {
      try {
        WidgetsBinding.instance.addObserver(this);
      } on Object catch (_) {}
    }
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChanged,
    );
    unawaited(checkNow());
  }

  final ReachabilityProbe _probe;
  final Connectivity _connectivity;
  final Future<int?> Function()? _pingChecker;

  final StreamController<NetworkState> _stateController =
      StreamController<NetworkState>.broadcast();
  final StreamController<void> _restoredController =
      StreamController<void>.broadcast();

  NetworkState _currentState = NetworkState.checking;
  NetworkIssue _lastIssue = NetworkIssue.none;
  NetworkIssue _lastEmittedIssue = NetworkIssue.none;

  int _slowPingHits = 0;
  int _slowHttpHits = 0;
  DateTime? _lastSlowHttpAt;
  Timer? _slowHttpDecayTimer;

  int _consecutiveFailures = 0;
  int _recoveryAttempt = 0;
  bool _forceConsensus = true;

  Future<void>? _inFlight;
  bool _recheck = false;
  int _epoch = 0;

  DateTime? _lastFailureCheckAt;
  bool _isBackground = false;
  bool _isDisposed = false;
  Timer? _timer;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  Stream<NetworkState> get stateStream => _stateController.stream;

  @override
  Stream<void> get connectivityRestoredStream => _restoredController.stream;

  @override
  NetworkState get currentState => _currentState;

  @override
  NetworkIssue get lastIssue => _lastIssue;

  @override
  bool get isStable => _currentState == NetworkState.connected;

  @override
  Future<bool> hasConnection() async {
    if (_currentState == NetworkState.checking) {
      await checkNow();
    }
    return _currentState == NetworkState.connected ||
        _currentState == NetworkState.unstable;
  }

  @override
  Future<void> checkNow() =>
      _inFlight ??= _runChecks().whenComplete(() => _inFlight = null);

  Future<void> _runChecks() async {
    var completedEpoch = false;
    try {
      do {
        _recheck = false;
        completedEpoch = await _performCheck();
      } while (_recheck && !_isDisposed);
    } finally {
      if (completedEpoch && !_isDisposed) {
        _scheduleNext();
      }
    }
  }

  void _handleConnectivityChanged(List<ConnectivityResult> results) {
    if (_isDisposed) return;
    _epoch++;
    _forceConsensus = true;

    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      _recheck = false;
      _lastIssue = NetworkIssue.noInterface;
      _updateState(NetworkState.disconnected);
      _scheduleNext();
    } else {
      _recheck = true;
      if (!_isBackground) {
        unawaited(checkNow());
      }
    }
  }

  Future<bool> _performCheck() async {
    final startEpoch = _epoch;
    final results = await _connectivity.checkConnectivity();
    if (_isDisposed || _epoch != startEpoch) return false;

    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      _lastIssue = NetworkIssue.noInterface;
      _slowPingHits = 0;
      _consecutiveFailures = 0;
      _updateState(NetworkState.disconnected);
      return true;
    }

    final useFullCheck =
        _currentState == NetworkState.checking ||
        _currentState == NetworkState.disconnected ||
        _forceConsensus;

    final outcome = await _evaluateReachability(
      useFullCheck: useFullCheck,
      startEpoch: startEpoch,
    );

    if (_isDisposed || _epoch != startEpoch) return false;

    if (!outcome.ok) {
      _lastIssue = outcome.issue;
      _slowPingHits = 0;
      _consecutiveFailures++;
      final wasOnline =
          _currentState == NetworkState.connected ||
          _currentState == NetworkState.unstable;
      final requiredFailures = wasOnline
          ? NetworkConfig.failuresBeforeDisconnect
          : 1;
      if (_consecutiveFailures >= requiredFailures) {
        _updateState(NetworkState.disconnected);
      }
      return true;
    }

    _consecutiveFailures = 0;
    _forceConsensus = false;
    _lastIssue = NetworkIssue.none;
    _recoveryAttempt = 0;

    final latency = outcome.latencyMs ?? 0;
    if (latency >= NetworkConfig.slowPingThresholdMs) {
      _slowPingHits++;
    } else {
      _slowPingHits = 0;
    }

    _applyStability();
    return true;
  }

  Future<({bool ok, int? latencyMs, NetworkIssue issue})>
  _evaluateReachability({
    required bool useFullCheck,
    required int startEpoch,
  }) async {
    if (_pingChecker != null) {
      final latency = await _pingChecker();
      if (_isDisposed || _epoch != startEpoch) {
        return (ok: false, latencyMs: null, issue: NetworkIssue.noInternet);
      }
      if (latency != null) {
        return (ok: true, latencyMs: latency, issue: NetworkIssue.none);
      }
      return (ok: false, latencyMs: null, issue: NetworkIssue.noInternet);
    }

    if (!useFullCheck) {
      final primaryResult = await _probe.runPrimary();
      if (_isDisposed || _epoch != startEpoch) {
        return (ok: false, latencyMs: null, issue: NetworkIssue.noInternet);
      }
      if (primaryResult.isOk) {
        return (
          ok: true,
          latencyMs: primaryResult.latencyMs,
          issue: NetworkIssue.none,
        );
      }
    }

    final summary = await _probe.runAll();
    if (_isDisposed || _epoch != startEpoch) {
      return (ok: false, latencyMs: null, issue: NetworkIssue.noInternet);
    }
    return (
      ok: summary.isSuccess,
      latencyMs: summary.latencyMs,
      issue: summary.issue,
    );
  }

  void _applyStability() {
    if (_lastSlowHttpAt != null &&
        DateTime.now().difference(_lastSlowHttpAt!) >=
            NetworkConfig.slowHttpDecay) {
      _slowHttpHits = 0;
      _lastSlowHttpAt = null;
      _slowHttpDecayTimer?.cancel();
      _slowHttpDecayTimer = null;
    }

    if (_slowPingHits >= NetworkConfig.maxSlowHits ||
        _slowHttpHits >= NetworkConfig.maxSlowHits) {
      _updateState(NetworkState.unstable);
    } else {
      _updateState(NetworkState.connected);
    }
  }

  @override
  void reportLatency(int ms) {
    if (_isBackground ||
        _isDisposed ||
        _currentState == NetworkState.disconnected ||
        _currentState == NetworkState.checking) {
      return;
    }

    if (ms >= NetworkConfig.slowDioThresholdMs) {
      _slowHttpHits++;
      _lastSlowHttpAt = DateTime.now();
      _slowHttpDecayTimer?.cancel();
      _slowHttpDecayTimer = Timer(NetworkConfig.slowHttpDecay, () {
        if (!_isDisposed) {
          _applyStability();
        }
      });
    } else {
      _slowHttpHits = 0;
      _lastSlowHttpAt = null;
      _slowHttpDecayTimer?.cancel();
      _slowHttpDecayTimer = null;
    }

    _applyStability();
  }

  @override
  void reportRequestFailure() {
    if (_isBackground ||
        _isDisposed ||
        _currentState == NetworkState.disconnected) {
      return;
    }

    final now = DateTime.now();
    if (_lastFailureCheckAt != null &&
        now.difference(_lastFailureCheckAt!) <
            NetworkConfig.failureCheckDebounce) {
      return;
    }

    _lastFailureCheckAt = now;
    _forceConsensus = true;
    unawaited(checkNow());
  }

  void _scheduleNext() {
    _timer?.cancel();
    if (_isBackground || _isDisposed) return;

    final Duration delay;
    if (_currentState == NetworkState.disconnected) {
      const backoff = NetworkConfig.recoveryBackoffSeconds;
      final index = math.min(_recoveryAttempt, backoff.length - 1);
      delay = Duration(seconds: backoff[index]);
      _recoveryAttempt++;
    } else if (_consecutiveFailures > 0) {
      delay = const Duration(seconds: 1);
    } else {
      delay = const Duration(seconds: NetworkConfig.pingIntervalSeconds);
    }

    _timer = Timer(delay, () {
      if (!_isBackground && !_isDisposed) {
        unawaited(checkNow());
      }
    });
  }

  void _updateState(NetworkState nextState) {
    if (_isDisposed || _stateController.isClosed) return;

    if (_currentState == nextState) {
      if (nextState == NetworkState.disconnected &&
          _lastIssue != _lastEmittedIssue) {
        _lastEmittedIssue = _lastIssue;
        _stateController.add(nextState);
      }
      return;
    }

    final previousState = _currentState;
    _currentState = nextState;
    _lastEmittedIssue = _lastIssue;

    if (nextState == NetworkState.disconnected) {
      _slowPingHits = 0;
      _slowHttpHits = 0;
      _lastSlowHttpAt = null;
      _slowHttpDecayTimer?.cancel();
      _slowHttpDecayTimer = null;
      _recoveryAttempt = 0;
      _consecutiveFailures = 0;
      _forceConsensus = true;
    }

    _stateController.add(nextState);

    if (previousState == NetworkState.disconnected &&
        nextState == NetworkState.connected) {
      if (!_restoredController.isClosed) {
        _restoredController.add(null);
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _isBackground = true;
      _timer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _isBackground = false;
      _forceConsensus = true;
      _recheck = true;
      unawaited(checkNow());
    }
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;

    try {
      WidgetsBinding.instance.removeObserver(this);
    } on Object catch (_) {}

    _timer?.cancel();
    _timer = null;
    _slowHttpDecayTimer?.cancel();
    _slowHttpDecayTimer = null;
    unawaited(_connectivitySubscription?.cancel());
    _probe.close();
    unawaited(_stateController.close());
    unawaited(_restoredController.close());
  }
}
