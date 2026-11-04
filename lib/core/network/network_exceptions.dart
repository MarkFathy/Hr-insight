import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';

class NetworkExceptions {
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
    if (resData case {'message': final msg?} when msg.toString().isNotEmpty) {
      throw ServerException(msg.toString());
    } else if (resData case final String str when str.isNotEmpty) {
      try {
        final decoded = jsonDecode(str);
        if (decoded case {
          'message': final msg?,
        } when msg.toString().isNotEmpty) {
          throw ServerException(msg.toString());
        }
      } on Exception catch (_) {}
      throw ServerException(str);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.transformTimeout:
        throw ServerException(timeoutMessage);
      case DioExceptionType.connectionError:
        throw ServerException(noInternetMessage);
      case DioExceptionType.badResponse ||
          DioExceptionType.badCertificate ||
          DioExceptionType.cancel ||
          DioExceptionType.unknown:
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

typedef DioErrorHandler = NetworkExceptions;
