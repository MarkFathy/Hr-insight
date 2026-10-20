import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockToken extends Mock implements Token {}

void main() {
  late AuthLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockPrefs;
  late MockToken mockToken;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    mockToken = MockToken();
    dataSource = AuthLocalDataSourceImpl(mockPrefs, mockToken);
  });

  group('AuthLocalDataSourceImpl.save', () {
    test('successfully saves when data contains nested map with token', () async {
      when(() => mockPrefs.setString(any(), any()))
          .thenAnswer((_) async => true);

      final userData = {
        'status': 1,
        'message': 'Success',
        'data': {
          'token': 'test_token_123',
          'data': {'id': 156, 'name': 'Test User'},
        },
      };

      final result = await dataSource.save(userData, isEmployee: true);

      expect(result, isTrue);
      verify(() => mockToken.setToken('test_token_123')).called(1);
      verify(() => mockPrefs.setString('/auth', any())).called(1);
    });

    test('successfully saves when data contains UserDataEntity instance', () async {
      when(() => mockPrefs.setString(any(), any()))
          .thenAnswer((_) async => true);

      const entity = UserDataEntity(token: 'entity_token_456');
      final userData = {
        'status': 1,
        'message': 'Success',
        'data': entity,
      };

      final result = await dataSource.save(userData, isEmployee: true);

      expect(result, isTrue);
      verify(() => mockToken.setToken('entity_token_456')).called(1);
    });

    test('successfully saves when data contains TokenDataEntity instance', () async {
      when(() => mockPrefs.setString(any(), any()))
          .thenAnswer((_) async => true);

      const entity = TokenDataEntity(token: 'manager_token_789');
      final userData = {
        'status': 1,
        'message': 'Success',
        'data': entity,
      };

      final result = await dataSource.save(userData, isEmployee: false);

      expect(result, isTrue);
      verify(() => mockToken.setToken('manager_token_789')).called(1);
    });

    test('invalidates token when token is missing or empty', () async {
      when(() => mockPrefs.setString(any(), any()))
          .thenAnswer((_) async => true);

      final userData = {'status': 1, 'data': <String, dynamic>{}};

      final result = await dataSource.save(userData, isEmployee: true);

      expect(result, isTrue);
      verify(() => mockToken.invalidate()).called(1);
    });
  });

  group('AuthLocalDataSourceImpl.autoLogin', () {
    test('throws EmptyCacheException when no cached user found', () {
      when(() => mockPrefs.getString(any())).thenReturn(null);

      expect(() => dataSource.autoLogin(), throwsA(isA<EmptyCacheException>()));
    });

    test('returns decoded data and sets token when cache exists', () {
      final cachedPayload = jsonEncode({
        'isEmployee': true,
        'data': {
          'data': {'token': 'cached_token_xyz'},
        },
      });
      when(() => mockPrefs.getString('/auth')).thenReturn(cachedPayload);

      final result = dataSource.autoLogin();

      expect(result, isNotNull);
      expect(result?['isEmployee'], isTrue);
      verify(() => mockToken.setToken('cached_token_xyz')).called(1);
    });
  });

  group('AuthLocalDataSourceImpl.logout', () {
    test('clears token and removes auth key from shared preferences', () async {
      when(() => mockPrefs.remove('/auth')).thenAnswer((_) async => true);

      final result = await dataSource.logout();

      expect(result, 'SignOut Success');
      verify(() => mockToken.clearToken()).called(1);
      verify(() => mockPrefs.remove('/auth')).called(1);
    });
  });
}
