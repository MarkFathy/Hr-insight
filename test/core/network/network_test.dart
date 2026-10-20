import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/network/dio_client.dart';
import 'package:hr_app/src/core/network/dio_error_handler.dart';
import 'package:hr_app/src/core/public_models/token.dart';

void main() {
  group('Token in-memory caching tests', () {
    test('Token cache set, get, and clear works without error', () {
      final token = Token();
      expect(token.getToken, '');

      token.setToken('test_jwt_token_123');
      expect(token.getToken, 'test_jwt_token_123');

      token.clearToken();
      expect(token.getToken, '');
    });
  });

  group('DioErrorHandler tests', () {
    test('throws ServerException with message from Map response', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'message': 'Invalid credentials'},
        ),
        type: DioExceptionType.badResponse,
      );

      expect(
        () => DioErrorHandler.handle(dioException),
        throwsA(
          isA<ServerException>().having(
            (e) => e.message,
            'message',
            'Invalid credentials',
          ),
        ),
      );
    });

    test('throws ServerException with message from String response', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
          data: 'Server Error Occurred',
        ),
        type: DioExceptionType.badResponse,
      );

      expect(
        () => DioErrorHandler.handle(dioException),
        throwsA(
          isA<ServerException>().having(
            (e) => e.message,
            'message',
            'Server Error Occurred',
          ),
        ),
      );
    });
  });

  group('DioClient configuration tests', () {
    test('DioClient initializes with standard timeouts and interceptors', () {
      final token = Token()..setToken('mock_token');
      final client = DioClient(token: token);

      expect(client.dio.options.connectTimeout, const Duration(seconds: 15));
      expect(client.dio.options.receiveTimeout, const Duration(seconds: 15));
      expect(client.dio.options.sendTimeout, const Duration(seconds: 15));
      expect(client.dio.interceptors.isNotEmpty, isTrue);
    });
  });
}
