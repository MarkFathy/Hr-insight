import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr_app/src/core/error/exceptions.dart';

abstract class AuthLocalSource {
  Map? autoLogin();
  Future<bool> save(Map userData, bool isEmployee);
  Future<String> logout();
}

class AuthLocalSourceImpl extends AuthLocalSource {
  final SharedPreferences sh;
  final authKey = "/auth";
  AuthLocalSourceImpl(this.sh);
  @override
  Map? autoLogin() {
    String? resData = sh.getString(authKey);
    if (resData == null) {
      throw EmptyCacheException('You are not signed!');
    }
    return jsonDecode(resData);
    // sh.clear();
  }

  @override
  Future<bool> save(Map userData, bool isEmployee) async {
    return sh.setString(
        authKey, json.encode({'isEmployee': isEmployee, 'data': userData}));
  }

  @override
  Future<String> logout() async {
    if (await sh.clear()) {
      return "SignOut Success";
    }
    return "Faild signout!";
  }
}
