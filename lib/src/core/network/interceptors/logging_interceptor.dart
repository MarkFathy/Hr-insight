import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Interceptor that safely logs HTTP traffic in debug mode,
/// redacting sensitive fields like passwords, tokens, and authorization headers.
class SafeLoggingInterceptor extends Interceptor {
  static const _sensitiveKeys = {
    'password',
    'old_password',
    'password_confirmation',
    'token',
    'authorization',
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      final sanitizedHeaders = Map<String, dynamic>.from(options.headers);
      if (sanitizedHeaders.containsKey('Authorization')) {
        sanitizedHeaders['Authorization'] = 'Bearer [REDACTED]';
      }

      final sanitizedData = _sanitizeData(options.data);
      debugPrint(
        '--> ${options.method} ${options.uri}\n'
        'Headers: $sanitizedHeaders\n'
        'Body: $sanitizedData',
      );
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '<-- ${response.statusCode} ${response.requestOptions.uri}\n'
        'Response: ${response.data}',
      );
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '<-- ERROR ${err.response?.statusCode} ${err.requestOptions.uri}\n'
        'Message: ${err.message}\n'
        'Response: ${err.response?.data}',
      );
    }
    return handler.next(err);
  }

  dynamic _sanitizeData(dynamic data) {
    if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      for (final key in map.keys.toList()) {
        if (_sensitiveKeys.contains(key.toLowerCase())) {
          map[key] = '[REDACTED]';
        } else if (map[key] is Map || map[key] is List) {
          map[key] = _sanitizeData(map[key]);
        }
      }
      return map;
    } else if (data is FormData) {
      return '[FormData ${data.fields.length} fields, ${data.files.length} files]';
    }
    return data;
  }
}
