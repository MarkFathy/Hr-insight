import 'dart:convert';
import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String password;
  final String passwordConfirmation;
  final String? token;
  final bool isEmployee;

  const ResetPasswordParams(
      {this.token,
      required this.password,
      required this.passwordConfirmation,
      this.isEmployee = true});

  @override
  List<Object> get props => [password, passwordConfirmation];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password.toString(),
      'password_confirmation': passwordConfirmation.toString(),
    };
  }

  factory ResetPasswordParams.fromMap(Map<String, dynamic> map) {
    return ResetPasswordParams(
      password: map['password'] as String,
      passwordConfirmation: map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordParams.fromJson(String source) =>
      ResetPasswordParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
