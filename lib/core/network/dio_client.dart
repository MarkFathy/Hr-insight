import 'package:dio/dio.dart';
import 'package:hr_app/core/constants/app_constants.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/network/interceptors/auth_interceptor.dart';
import 'package:hr_app/core/network/interceptors/logging_interceptor.dart';
import 'package:hr_app/core/public_models/token.dart';
import 'package:hr_app/core/service/stability_interceptor.dart';

/// Centralized Dio HTTP client wrapper with standard configuration,
/// timeouts, interceptors, and request methods.
class DioClient {
  final Dio _dio;

  DioClient({required Token token, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: AppConstants.baseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              sendTimeout: const Duration(seconds: 15),
              headers: {'Accept': 'application/json'},
            ),
          ) {
    if (sl.isRegistered<StabilityInterceptor>()) {
      _dio.interceptors.add(sl<StabilityInterceptor>());
    }
    _dio.interceptors.addAll([
      AuthInterceptor(token: token),
      SafeLoggingInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async => _dio.get<dynamic>(
    path,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async => _dio.post<dynamic>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async => _dio.put<dynamic>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );

  Future<Response<dynamic>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async => _dio.delete<dynamic>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
  );
}
