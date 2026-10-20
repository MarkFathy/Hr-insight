import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';

class DioErrorHandler {
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
    throw ServerException(
      e.message ?? 'An error occurred during network request',
    );
  }
}
