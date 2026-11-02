import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';
import 'package:hr_app/core/service/stability_interceptor.dart';

class FakeInternetConnectionService extends Fake
    implements IInternetConnectionService {
  final List<int> reportedLatencies = [];
  int reportedFailures = 0;

  @override
  void reportLatency(int ms) {
    reportedLatencies.add(ms);
  }

  @override
  void reportRequestFailure() {
    reportedFailures++;
  }
}

class FakeRequestInterceptorHandler extends RequestInterceptorHandler {
  RequestOptions? nextOptions;

  @override
  void next(RequestOptions requestOptions) {
    nextOptions = requestOptions;
  }
}

class FakeResponseInterceptorHandler extends ResponseInterceptorHandler {
  Response<dynamic>? nextResponse;

  @override
  void next(Response<dynamic> response) {
    nextResponse = response;
  }
}

class FakeErrorInterceptorHandler extends ErrorInterceptorHandler {
  DioException? nextError;

  @override
  void next(DioException err) {
    nextError = err;
  }
}

void main() {
  group('StabilityInterceptor Tests', () {
    late FakeInternetConnectionService service;
    late StabilityInterceptor interceptor;

    setUp(() {
      service = FakeInternetConnectionService();
      interceptor = StabilityInterceptor(service);
    });

    test('records start time on request and measures latency on response', () {
      final options = RequestOptions(path: '/test');
      final reqHandler = FakeRequestInterceptorHandler();
      interceptor.onRequest(options, reqHandler);

      expect(reqHandler.nextOptions, isNotNull);
      expect(
        reqHandler.nextOptions!.extra.containsKey('stability_startTime'),
        isTrue,
      );

      final respHandler = FakeResponseInterceptorHandler();
      final response = Response<dynamic>(
        requestOptions: reqHandler.nextOptions!,
        statusCode: 200,
      );

      interceptor.onResponse(response, respHandler);
      expect(respHandler.nextResponse, equals(response));
      expect(service.reportedLatencies.length, equals(1));
      expect(service.reportedLatencies.first, greaterThanOrEqualTo(0));
    });

    test(
      'measures latency on badResponse (4xx/5xx) without reporting failure',
      () {
        final options = RequestOptions(
          path: '/test',
          extra: {
            'stability_startTime': DateTime.now().millisecondsSinceEpoch - 50,
          },
        );
        final err = DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
        );
        final errHandler = FakeErrorInterceptorHandler();

        interceptor.onError(err, errHandler);
        expect(errHandler.nextError, equals(err));
        expect(service.reportedLatencies.length, equals(1));
        expect(service.reportedFailures, equals(0));
      },
    );

    test(
      'reports latency and failure on connection, send, and receive timeouts',
      () {
        for (final type in [
          DioExceptionType.connectionTimeout,
          DioExceptionType.sendTimeout,
          DioExceptionType.receiveTimeout,
        ]) {
          final options = RequestOptions(
            path: '/test',
            extra: {
              'stability_startTime':
                  DateTime.now().millisecondsSinceEpoch - 100,
            },
          );
          final err = DioException(requestOptions: options, type: type);
          final errHandler = FakeErrorInterceptorHandler();

          interceptor.onError(err, errHandler);
        }

        expect(service.reportedFailures, equals(3));
        expect(service.reportedLatencies.length, equals(3));
      },
    );

    test(
      'reports failure ONLY on connectionError (no fast latency recorded)',
      () {
        final options = RequestOptions(
          path: '/test',
          extra: {'stability_startTime': DateTime.now().millisecondsSinceEpoch},
        );
        final err = DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
        );
        final errHandler = FakeErrorInterceptorHandler();

        interceptor.onError(err, errHandler);
        expect(errHandler.nextError, equals(err));
        expect(service.reportedFailures, equals(1));
        expect(service.reportedLatencies.isEmpty, isTrue);
      },
    );

    test('ignores cancel, badCertificate, unknown, and transformTimeout', () {
      for (final type in [
        DioExceptionType.cancel,
        DioExceptionType.badCertificate,
        DioExceptionType.unknown,
        DioExceptionType.transformTimeout,
      ]) {
        final options = RequestOptions(
          path: '/test',
          extra: {'stability_startTime': DateTime.now().millisecondsSinceEpoch},
        );
        final err = DioException(requestOptions: options, type: type);
        final errHandler = FakeErrorInterceptorHandler();

        interceptor.onError(err, errHandler);
      }

      expect(service.reportedFailures, equals(0));
      expect(service.reportedLatencies.isEmpty, isTrue);
    });

    test('ignores requests with skipKey set to true', () {
      final options = RequestOptions(
        path: '/test',
        extra: {StabilityInterceptor.skipKey: true},
      );
      final reqHandler = FakeRequestInterceptorHandler();
      interceptor.onRequest(options, reqHandler);

      expect(
        reqHandler.nextOptions!.extra.containsKey('stability_startTime'),
        isFalse,
      );

      final respHandler = FakeResponseInterceptorHandler();
      interceptor.onResponse(
        Response<dynamic>(requestOptions: options),
        respHandler,
      );

      final errHandler = FakeErrorInterceptorHandler();
      interceptor.onError(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionTimeout,
        ),
        errHandler,
      );

      expect(service.reportedLatencies.isEmpty, isTrue);
      expect(service.reportedFailures, equals(0));
    });
  });
}
