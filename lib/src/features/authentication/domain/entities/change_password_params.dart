import 'dart:convert';
import 'package:equatable/equatable.dart';

class ChangePasswordParams extends Equatable {
  final bool? isEmployee;
  final String oldPassword;
  final String password;
  final String passwordConfirmation;
  final String? token;

  const ChangePasswordParams(
      {required this.oldPassword,
      this.isEmployee,
      this.token,
      required this.password,
      required this.passwordConfirmation});

  @override
  List<Object> get props => [oldPassword, password, passwordConfirmation];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'old_password': oldPassword,
      'password': password.toString(),
      'password_confirmation': passwordConfirmation.toString(),
    };
  }

  factory ChangePasswordParams.fromMap(Map<String, dynamic> map) {
    return ChangePasswordParams(
      oldPassword: map['old_password'] as String,
      password: map['password'] as String,
      passwordConfirmation: map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordParams.fromJson(String source) =>
      ChangePasswordParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
