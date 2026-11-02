import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';

class FakeConnectivity extends Fake implements Connectivity {
  final StreamController<List<ConnectivityResult>> _controller =
      StreamController<List<ConnectivityResult>>.broadcast();
  List<ConnectivityResult> currentResult = [ConnectivityResult.wifi];

  void emit(List<ConnectivityResult> results) {
    currentResult = results;
    _controller.add(results);
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _controller.stream;

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async => currentResult;

  void dispose() {
    unawaited(_controller.close());
  }
}

class FakeReachabilityProbe extends Fake implements ReachabilityProbe {
  ProbeResult primaryResult = const ProbeResult.ok(50);
  ProbeSummary summaryResult = const ProbeSummary(
    isSuccess: true,
    issue: NetworkIssue.none,
    results: [ProbeResult.ok(50)],
    latencyMs: 50,
  );
  int runPrimaryCalls = 0;
  int runAllCalls = 0;
  Completer<ProbeSummary>? pendingSummaryCompleter;

  @override
  Future<ProbeResult> runPrimary() async {
    runPrimaryCalls++;
    return primaryResult;
  }

  @override
  Future<ProbeSummary> runAll() async {
    runAllCalls++;
    if (pendingSummaryCompleter != null) {
      return pendingSummaryCompleter!.future;
    }
    return summaryResult;
  }

  @override
  void close() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('InternetConnectionService Tests', () {
    late FakeConnectivity fakeConnectivity;
    late FakeReachabilityProbe fakeProbe;

    setUp(() {
      fakeConnectivity = FakeConnectivity();
      fakeProbe = FakeReachabilityProbe();
    });

    tearDown(() {
      fakeConnectivity.dispose();
    });

    test(
      'Hardware interface none -> immediate disconnected with lastIssue == NetworkIssue.noInterface',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.none];
        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        expect(service.currentState, equals(NetworkState.disconnected));
        expect(service.lastIssue, equals(NetworkIssue.noInterface));
        service.dispose();
      },
    );

    test(
      'Interface up + all probes fail -> disconnected with lastIssue == NetworkIssue.noInternet',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        fakeProbe.summaryResult = const ProbeSummary(
          isSuccess: false,
          issue: NetworkIssue.noInternet,
          results: [ProbeResult.failed()],
        );

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        expect(service.currentState, equals(NetworkState.disconnected));
        expect(service.lastIssue, equals(NetworkIssue.noInternet));
        service.dispose();
      },
    );

    test(
      'Interface up + probe returns portal -> disconnected with lastIssue == NetworkIssue.captivePortal',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        fakeProbe.summaryResult = const ProbeSummary(
          isSuccess: false,
          issue: NetworkIssue.captivePortal,
          results: [ProbeResult.portal()],
        );

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        expect(service.currentState, equals(NetworkState.disconnected));
        expect(service.lastIssue, equals(NetworkIssue.captivePortal));
        service.dispose();
      },
    );

    test(
      'Hysteresis while online: 1st failure keeps state connected; 2nd consecutive failure transitions to disconnected',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        fakeProbe.summaryResult = const ProbeSummary(
          isSuccess: true,
          issue: NetworkIssue.none,
          results: [ProbeResult.ok(40)],
          latencyMs: 40,
        );

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        expect(service.currentState, equals(NetworkState.connected));

        // 1st failure: probe returns failure
        fakeProbe
          ..primaryResult = const ProbeResult.failed()
          ..summaryResult = const ProbeSummary(
            isSuccess: false,
            issue: NetworkIssue.noInternet,
            results: [ProbeResult.failed()],
          );

        await service.checkNow();
        expect(
          service.currentState,
          equals(NetworkState.connected),
          reason: '1st failure must keep state connected (hysteresis)',
        );
        expect(service.lastIssue, equals(NetworkIssue.noInternet));

        // 2nd consecutive failure: transitions to disconnected
        await service.checkNow();
        expect(
          service.currentState,
          equals(NetworkState.disconnected),
          reason: '2nd failure transitions to disconnected',
        );
        service.dispose();
      },
    );

    test(
      'Active offline recovery via backoff: transitions to connected and fires connectivityRestoredStream',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.none];
        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        expect(service.currentState, equals(NetworkState.disconnected));

        var restoredFired = 0;
        final sub = service.connectivityRestoredStream.listen((_) {
          restoredFired++;
        });

        // Now Wi-Fi turns back on and endpoints succeed
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        fakeProbe.summaryResult = const ProbeSummary(
          isSuccess: true,
          issue: NetworkIssue.none,
          results: [ProbeResult.ok(40)],
          latencyMs: 40,
        );

        await service.checkNow();
        await Future<void>.delayed(Duration.zero);
        expect(service.currentState, equals(NetworkState.connected));
        expect(restoredFired, equals(1));

        await sub.cancel();
        service.dispose();
      },
    );

    test(
      'Separate slowPingHits and slowHttpHits counters, 30s HTTP decay, and unstable transitions',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        fakeProbe
          ..primaryResult = const ProbeResult.ok(800)
          ..summaryResult = const ProbeSummary(
            isSuccess: true,
            issue: NetworkIssue.none,
            results: [ProbeResult.ok(800)],
            latencyMs: 800,
          );

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        // Ping 1 (800ms >= 700ms threshold)
        await service.checkNow();
        expect(service.currentState, equals(NetworkState.connected));

        // Ping 2
        await service.checkNow();
        expect(service.currentState, equals(NetworkState.connected));

        // Ping 3 (hits maxSlowHits = 3) -> transitions to unstable!
        await service.checkNow();
        expect(service.currentState, equals(NetworkState.unstable));

        // Fast ping resets ping counter back to connected
        fakeProbe
          ..primaryResult = const ProbeResult.ok(100)
          ..summaryResult = const ProbeSummary(
            isSuccess: true,
            issue: NetworkIssue.none,
            results: [ProbeResult.ok(100)],
            latencyMs: 100,
          );
        await service.checkNow();
        expect(service.currentState, equals(NetworkState.connected));

        // HTTP latency reporting
        service.reportLatency(3000); // 1st slow HTTP hit
        expect(service.currentState, equals(NetworkState.connected));

        service.reportLatency(3100); // 2nd
        expect(service.currentState, equals(NetworkState.connected));

        service.reportLatency(3200); // 3rd -> unstable!
        expect(service.currentState, equals(NetworkState.unstable));

        // Fast HTTP call resets hits
        service.reportLatency(200);
        expect(service.currentState, equals(NetworkState.connected));

        service.dispose();
      },
    );

    test(
      'hasConnection() awaits in-flight initial check without false negatives',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        final completer = Completer<ProbeSummary>();
        fakeProbe.pendingSummaryCompleter = completer;

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        expect(service.currentState, equals(NetworkState.checking));

        final hasConnectionFuture = service.hasConnection();
        completer.complete(
          const ProbeSummary(
            isSuccess: true,
            issue: NetworkIssue.none,
            results: [ProbeResult.ok(40)],
            latencyMs: 40,
          ),
        );

        final hasConnection = await hasConnectionFuture;
        expect(hasConnection, isTrue);
        expect(service.currentState, equals(NetworkState.connected));
        service.dispose();
      },
    );

    test(
      'Epoch guard discards stale in-flight check results when a connectivity change occurs mid-probe',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        final completer = Completer<ProbeSummary>();
        fakeProbe.pendingSummaryCompleter = completer;

        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        // Mid-probe: hardware interface drops to none
        fakeConnectivity.emit([ConnectivityResult.none]);

        // Complete the pending probe with success
        completer.complete(
          const ProbeSummary(
            isSuccess: true,
            issue: NetworkIssue.none,
            results: [ProbeResult.ok(40)],
            latencyMs: 40,
          ),
        );

        await Future<void>.delayed(const Duration(milliseconds: 50));
        // State must be disconnected (due to noInterface), stale probe success must NOT override it
        expect(service.currentState, equals(NetworkState.disconnected));
        expect(service.lastIssue, equals(NetworkIssue.noInterface));
        service.dispose();
      },
    );

    test(
      'reportRequestFailure() triggers a consensus check and debounces within 3s',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        final initialAllCalls = fakeProbe.runAllCalls;

        // 1st failure report triggers checkNow
        service.reportRequestFailure();
        await Future<void>.delayed(const Duration(milliseconds: 20));
        expect(fakeProbe.runAllCalls, greaterThan(initialAllCalls));

        final secondAllCalls = fakeProbe.runAllCalls;
        // 2nd report within debounce period is ignored
        service.reportRequestFailure();
        await Future<void>.delayed(const Duration(milliseconds: 20));
        expect(fakeProbe.runAllCalls, equals(secondAllCalls));

        service.dispose();
      },
    );

    test(
      'AppLifecycle: paused/hidden stop timers; resumed forces consensus check',
      () async {
        fakeConnectivity.currentResult = [ConnectivityResult.wifi];
        final service = InternetConnectionService(
          connectivity: fakeConnectivity,
          probe: fakeProbe,
          registerObserver: false,
        );

        await service.checkNow();
        final callsBefore = fakeProbe.runAllCalls;

        service
          ..didChangeAppLifecycleState(AppLifecycleState.inactive)
          ..didChangeAppLifecycleState(AppLifecycleState.paused)
          ..didChangeAppLifecycleState(AppLifecycleState.resumed);
        await Future<void>.delayed(const Duration(milliseconds: 20));

        expect(fakeProbe.runAllCalls, greaterThan(callsBefore));
        service.dispose();
      },
    );
  });
}
