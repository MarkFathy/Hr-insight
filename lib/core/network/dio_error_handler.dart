import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/errors/exceptions.dart';

class DioErrorHandler {
  static const String noInternetMessage =
      'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة والمحاولة مرة أخرى';

  static const String timeoutMessage =
      'انتهت مهلة الاتصال بالخادم، يرجى التحقق من الإنترنت والمحاولة مرة أخرى';

  static const String defaultErrorMessage =
      'حدث خطأ أثناء الاتصال بالخادم، يرجى المحاولة مرة أخرى';

  /// Checks whether an error message or exception string indicates a
  /// network/connectivity issue rather than a business/server error.
  static bool isNetworkError(String? message) {
    if (message == null || message.isEmpty) return false;
    final lower = message.toLowerCase();
    return message == noInternetMessage ||
        message == timeoutMessage ||
        lower.contains('لا يوجد اتصال') ||
        lower.contains('مهلة الاتصال') ||
        lower.contains('بدون إنترنت') ||
        lower.contains('failed host lookup') ||
        lower.contains('socketexception') ||
        lower.contains('connection errored') ||
        lower.contains('network is unreachable') ||
        lower.contains('software caused connection abort') ||
        lower.contains('connection refused') ||
        lower.contains('connection reset') ||
        lower.contains('connection timed out') ||
        lower.contains('connecting timed out') ||
        lower.contains('receiving data timed out') ||
        lower.contains('sending data timed out') ||
        lower.contains('no internet') ||
        lower.contains('no address associated with hostname');
  }

  static Never handle(DioException e) {
    final resData = e.response?.data;
    if (resData is Map && resData['message'] != null) {
      throw ServerException(resData['message'].toString());
    } else if (resData is String && resData.isNotEmpty) {
      try {
        final decoded = jsonDecode(resData);
        if (decoded is Map && decoded['message'] != null) {
          throw ServerException(decoded['message'].toString());
        }
      } on Exception catch (_) {}
      throw ServerException(resData);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        throw ServerException(timeoutMessage);
      case DioExceptionType.connectionError:
        throw ServerException(noInternetMessage);
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        final rawMessage = e.message ?? e.error?.toString() ?? '';
        if (isNetworkError(rawMessage)) {
          throw ServerException(noInternetMessage);
        }
        throw ServerException(
          rawMessage.isNotEmpty ? rawMessage : defaultErrorMessage,
        );
    }
  }
}
