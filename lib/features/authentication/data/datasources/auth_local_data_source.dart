import 'dart:convert';

import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/token_manager.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Map<String, dynamic>? autoLogin();
  Future<bool> save(Map<String, dynamic> userData, {required bool isEmployee});
  Future<String> logout();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sh;
  final authKey = '/auth';
  final Token? token;

  AuthLocalDataSourceImpl(this.sh, [this.token]);

  @override
  Map<String, dynamic>? autoLogin() {
    final resData = sh.getString(authKey);
    if (resData == null) {
      throw EmptyCacheException('You are not signed!');
    }
    final decoded = jsonDecode(resData) as Map<String, dynamic>;
    final dataMap = decoded['data'] as Map<String, dynamic>?;
    final nestedData = dataMap?['data'] as Map<String, dynamic>?;
    final tokenValue = nestedData?['token'];
    if (tokenValue is String && tokenValue.isNotEmpty) {
      token?.setToken(tokenValue);
    }
    return decoded;
  }

  @override
  Future<bool> save(
    Map<String, dynamic> userData, {
    required bool isEmployee,
  }) async {
    final rawData = userData['data'];
    final tokenValue = switch (rawData) {
      {'token': final String t} => t,
      UserDataEntity(:final token) => token,
      TokenDataEntity(:final token) => token,
      _ => null,
    };

    if (tokenValue != null && tokenValue.isNotEmpty) {
      token?.setToken(tokenValue);
    } else {
      token?.invalidate();
    }
    return sh.setString(
      authKey,
      json.encode({'isEmployee': isEmployee, 'data': userData}),
    );
  }

  @override
  Future<String> logout() async {
    token?.clearToken();
    if (await sh.remove(authKey)) {
      return 'SignOut Success';
    }
    return 'Faild signout!';
  }
}

/// Backwards compatibility aliases
typedef AuthLocalSource = AuthLocalDataSource;
typedef AuthLocalSourceImpl = AuthLocalDataSourceImpl;
