import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';
import 'package:hr_app/core/widgets/internet_connection_wrapper.dart';
import 'package:hr_app/localization/app_localizations.dart';

class FakeControllableConnectionService implements IInternetConnectionService {
  final StreamController<NetworkState> _stateCtrl =
      StreamController<NetworkState>.broadcast();
  final StreamController<void> _restoredCtrl =
      StreamController<void>.broadcast();

  NetworkState _current = NetworkState.connected;
  NetworkIssue _issue = NetworkIssue.none;
  int checkNowCalls = 0;

  void emitState(NetworkState state, {NetworkIssue issue = NetworkIssue.none}) {
    _current = state;
    _issue = issue;
    _stateCtrl.add(state);
  }

  @override
  Stream<NetworkState> get stateStream => _stateCtrl.stream;

  @override
  Stream<void> get connectivityRestoredStream => _restoredCtrl.stream;

  @override
  NetworkState get currentState => _current;

  @override
  NetworkIssue get lastIssue => _issue;

  @override
  bool get isStable => _current == NetworkState.connected;

  @override
  Future<bool> hasConnection() async =>
      _current == NetworkState.connected || _current == NetworkState.unstable;

  @override
  Future<void> checkNow() async {
    checkNowCalls++;
  }

  @override
  void reportLatency(int ms) {}

  @override
  void reportRequestFailure() {}

  @override
  void dispose() {
    unawaited(_stateCtrl.close());
    unawaited(_restoredCtrl.close());
  }
}

Widget createTestWidget({
  required IInternetConnectionService service,
  Widget child = const Text('App Content', key: Key('child_content')),
}) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: const Locale('en'),
  home: Scaffold(
    body: InternetConnectionWrapper(connectionService: service, child: child),
  ),
);

void main() {
  group('InternetConnectionWrapper Widget Tests', () {
    late FakeControllableConnectionService service;

    setUp(() {
      service = FakeControllableConnectionService();
    });

    tearDown(() {
      service.dispose();
    });

    testWidgets('Cold start connected shows no banner', (tester) async {
      await tester.pumpWidget(createTestWidget(service: service));
      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsNothing);
      expect(find.byKey(const Key('child_content')), findsOneWidget);
    });

    testWidgets(
      'Displays distinct icon and message for noInterface (disconnected)',
      (tester) async {
        service.emitState(
          NetworkState.disconnected,
          issue: NetworkIssue.noInterface,
        );

        await tester.pumpWidget(createTestWidget(service: service));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);
        expect(find.text('No Internet Connection — Try Again'), findsOneWidget);
      },
    );

    testWidgets('Displays distinct icon and message for noInternet', (
      tester,
    ) async {
      service.emitState(
        NetworkState.disconnected,
        issue: NetworkIssue.noInternet,
      );

      await tester.pumpWidget(createTestWidget(service: service));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.wifi_find_rounded), findsOneWidget);
      expect(
        find.text(
          'Connected to the network but no internet — check your data balance',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Displays distinct icon and message for captivePortal', (
      tester,
    ) async {
      service.emitState(
        NetworkState.disconnected,
        issue: NetworkIssue.captivePortal,
      );

      await tester.pumpWidget(createTestWidget(service: service));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.wifi_lock_rounded), findsOneWidget);
      expect(
        find.text(
          'Network needs sign-in or has no data balance — tap to check',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Displays distinct icon and message for unstable', (
      tester,
    ) async {
      service.emitState(NetworkState.unstable);

      await tester.pumpWidget(createTestWidget(service: service));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.wifi_protected_setup_rounded), findsOneWidget);
      expect(
        find.text('Unstable internet connection — loading may be slow'),
        findsOneWidget,
      );
    });

    testWidgets(
      'Updates banner text dynamically if lastIssue changes while in disconnected state',
      (tester) async {
        service.emitState(
          NetworkState.disconnected,
          issue: NetworkIssue.noInternet,
        );

        await tester.pumpWidget(createTestWidget(service: service));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.wifi_find_rounded), findsOneWidget);

        // Dynamically change issue to captivePortal
        service.emitState(
          NetworkState.disconnected,
          issue: NetworkIssue.captivePortal,
        );
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.wifi_lock_rounded), findsOneWidget);
        expect(
          find.text(
            'Network needs sign-in or has no data balance — tap to check',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Shows green restored banner on disconnected -> connected and auto-hides after 1800ms',
      (tester) async {
        service.emitState(
          NetworkState.disconnected,
          issue: NetworkIssue.noInterface,
        );

        await tester.pumpWidget(createTestWidget(service: service));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);

        // Transition to connected
        service.emitState(NetworkState.connected);
        await tester.pump();
        await tester.pump();

        expect(find.byIcon(Icons.check_circle_outline_rounded), findsOneWidget);
        expect(find.text('Internet connection restored'), findsOneWidget);

        // Before 1800ms, banner is still visible
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byIcon(Icons.check_circle_outline_rounded), findsOneWidget);

        // After 1800ms total, banner hides
        await tester.pump(const Duration(milliseconds: 900));
        await tester.pumpAndSettle();

        expect(find.byType(InkWell), findsNothing);
      },
    );

    testWidgets('Tapping the banner triggers checkNow()', (tester) async {
      service.emitState(
        NetworkState.disconnected,
        issue: NetworkIssue.noInterface,
      );

      await tester.pumpWidget(createTestWidget(service: service));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(service.checkNowCalls, equals(1));
    });
  });
}
