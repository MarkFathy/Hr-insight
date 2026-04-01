// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hr_app/src/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  String get getToken {
    final sh = sl<SharedPreferences>();
    if (sh.getString('/auth') == null) return '';
    return json.decode(sh.getString('/auth')!)['data']['data']['token'];
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'token': token,
  //   };
  // }

  // factory Token.fromMap(Map<String, dynamic> map) {
  //   return map['data'] == null
  //       ? Token(token: '')
  //       : Token(
  //           token: map['data']['data']['token'],
  //         );
  // }

  // String toJson() => json.encode(toMap());

  // factory Token.fromJson(String source) =>
  //     Token.fromMap(json.decode(source) as Map<String, dynamic>);
}
