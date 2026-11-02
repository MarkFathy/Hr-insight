import 'package:dio/dio.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';

/// Dio interceptor that measures HTTP round-trip latency and reports
/// network timeouts and connection errors to [IInternetConnectionService].
class StabilityInterceptor extends Interceptor {
  StabilityInterceptor(this._service);

  final IInternetConnectionService _service;

  /// Extra key to skip stability tracking for a specific request.
  static const String skipKey = 'skipStability';

  static const String _startTimeKey = 'stability_startTime';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra[skipKey] != true) {
      options.extra[_startTimeKey] = DateTime.now().millisecondsSinceEpoch;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final extra = response.requestOptions.extra;
    if (extra[skipKey] != true) {
      final startTime = extra[_startTimeKey] as int?;
      if (startTime != null) {
        final latency = DateTime.now().millisecondsSinceEpoch - startTime;
        _service.reportLatency(latency);
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final extra = err.requestOptions.extra;
    if (extra[skipKey] != true) {
      final startTime = extra[_startTimeKey] as int?;
      final latency = startTime != null
          ? DateTime.now().millisecondsSinceEpoch - startTime
          : null;

      switch (err.type) {
        case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.receiveTimeout:
          if (latency != null) {
            _service.reportLatency(latency);
          }
          _service.reportRequestFailure();
        case DioExceptionType.connectionError:
          _service.reportRequestFailure();
        case DioExceptionType.badResponse:
          if (latency != null) {
            _service.reportLatency(latency);
          }
        case DioExceptionType.cancel ||
            DioExceptionType.badCertificate ||
            DioExceptionType.unknown ||
            DioExceptionType.transformTimeout:
          break;
      }
    }
    handler.next(err);
  }
}
