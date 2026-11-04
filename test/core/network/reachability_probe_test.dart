import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/core/network/internet_connection_service.dart';

void main() {
  group('ReachabilityProbe Tests', () {
    late HttpServer server;
    late Uri serverUri;

    setUp(() async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      serverUri = Uri.parse('http://${server.address.host}:${server.port}');
      server.listen((request) async {
        final path = request.uri.path;
        if (path == '/204') {
          request.response
            ..statusCode = 204
            ..headers.set(HttpHeaders.contentTypeHeader, 'text/plain');
          await request.response.close();
        } else if (path == '/302') {
          request.response
            ..statusCode = 302
            ..headers.set(HttpHeaders.locationHeader, 'http://login.portal');
          await request.response.close();
        } else if (path == '/apple-ok') {
          request.response
            ..statusCode = 200
            ..headers.set(HttpHeaders.contentTypeHeader, 'text/html')
            ..write(
              '<HTML><HEAD><TITLE>Success</TITLE></HEAD><BODY>Success</BODY></HTML>',
            );
          await request.response.close();
        } else if (path == '/unexpected-200') {
          request.response
            ..statusCode = 200
            ..headers.set(HttpHeaders.contentTypeHeader, 'text/html')
            ..write('<html><body>Login Page</body></html>');
          await request.response.close();
        } else if (path == '/500') {
          request.response.statusCode = 500;
          await request.response.close();
        } else {
          request.response.statusCode = 404;
          await request.response.close();
        }
      });
    });

    tearDown(() async {
      await server.close(force: true);
    });

    test('204 status -> ProbeResult.ok(latency)', () async {
      final probe = ReachabilityProbe(
        targets: [
          ProbeTarget(
            serverUri.replace(path: '/204'),
            (status, body) => status == 204,
          ),
        ],
      );

      final result = await probe.run(probe.targets.first);
      expect(result.isOk, isTrue);
      expect(result.latencyMs, isNotNull);
      expect(result.isPortal, isFalse);
      expect(result.isFailed, isFalse);
      probe.close();
    });

    test('302 redirect -> ProbeResult.portal()', () async {
      final probe = ReachabilityProbe(
        targets: [
          ProbeTarget(
            serverUri.replace(path: '/302'),
            (status, body) => status == 204,
          ),
        ],
      );

      final result = await probe.run(probe.targets.first);
      expect(result.isPortal, isTrue);
      expect(result.isOk, isFalse);
      expect(result.isFailed, isFalse);
      probe.close();
    });

    test('200 with unexpected body -> ProbeResult.portal()', () async {
      final probe = ReachabilityProbe(
        targets: [
          ProbeTarget(
            serverUri.replace(path: '/unexpected-200'),
            (status, body) => status == 200 && body.contains('Success'),
          ),
        ],
      );

      final result = await probe.run(probe.targets.first);
      expect(result.isPortal, isTrue);
      expect(result.isOk, isFalse);
      expect(result.isFailed, isFalse);
      probe.close();
    });

    test(
      '200 with Success on Apple captive endpoint -> ProbeResult.ok(latency)',
      () async {
        final probe = ReachabilityProbe(
          targets: [
            ProbeTarget(
              serverUri.replace(path: '/apple-ok'),
              (status, body) => status == 200 && body.contains('Success'),
            ),
          ],
        );

        final result = await probe.run(probe.targets.first);
        expect(result.isOk, isTrue);
        expect(result.latencyMs, isNotNull);
        probe.close();
      },
    );

    test('500 or unreachable socket timeout -> ProbeResult.failed()', () async {
      final probe = ReachabilityProbe(
        targets: [
          ProbeTarget(
            serverUri.replace(path: '/500'),
            (status, body) => status == 200,
          ),
        ],
      );

      final result = await probe.run(probe.targets.first);
      expect(result.isFailed, isTrue);
      probe.close();
    });

    test(
      'runAll() consensus: succeeds when at least 2 of 3 targets succeed, returns median latency, updates primaryIndex',
      () async {
        final targets = [
          ProbeTarget(
            serverUri.replace(path: '/204'),
            (status, body) => status == 204,
          ),
          ProbeTarget(
            serverUri.replace(path: '/apple-ok'),
            (status, body) => status == 200 && body.contains('Success'),
          ),
          ProbeTarget(
            serverUri.replace(path: '/500'),
            (status, body) => status == 204,
          ),
        ];

        final probe = ReachabilityProbe(targets: targets);

        final summary = await probe.runAll();
        expect(summary.isSuccess, isTrue);
        expect(summary.issue, equals(NetworkIssue.none));
        expect(summary.latencyMs, isNotNull);
        expect(probe.primaryIndex, anyOf(equals(0), equals(1)));
        probe.close();
      },
    );

    test(
      'runAll() failure: classifies captivePortal vs noInternet correctly',
      () async {
        final portalProbe = ReachabilityProbe(
          targets: [
            ProbeTarget(
              serverUri.replace(path: '/302'),
              (status, body) => status == 204,
            ),
            ProbeTarget(
              serverUri.replace(path: '/unexpected-200'),
              (status, body) => status == 204,
            ),
            ProbeTarget(
              serverUri.replace(path: '/500'),
              (status, body) => status == 204,
            ),
          ],
        );

        final portalSummary = await portalProbe.runAll();
        expect(portalSummary.isSuccess, isFalse);
        expect(portalSummary.issue, equals(NetworkIssue.captivePortal));
        portalProbe.close();

        final noInternetProbe = ReachabilityProbe(
          targets: [
            ProbeTarget(
              serverUri.replace(path: '/500'),
              (status, body) => status == 204,
            ),
            ProbeTarget(
              serverUri.replace(path: '/500'),
              (status, body) => status == 204,
            ),
          ],
        );

        final noInternetSummary = await noInternetProbe.runAll();
        expect(noInternetSummary.isSuccess, isFalse);
        expect(noInternetSummary.issue, equals(NetworkIssue.noInternet));
        noInternetProbe.close();
      },
    );
  });
}
