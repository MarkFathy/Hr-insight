import 'package:dio/dio.dart';
import 'package:hr_app/core/network/token_manager.dart';

/// Interceptor that attaches the Bearer token to every outgoing HTTP request
/// when available.
class AuthInterceptor extends QueuedInterceptor {
  final Token token;

  AuthInterceptor({required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    final currentToken = token.getToken;
    if (currentToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $currentToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) =>
      handler.next(err);
}
