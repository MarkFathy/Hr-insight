import 'dart:convert';
import 'package:equatable/equatable.dart';

class VerifyParams extends Equatable {
  final String otp;
  final String email;
  final bool isEmployee;

  const VerifyParams(
      {required this.otp, required this.email, required this.isEmployee});

  @override
  List<Object> get props => [otp, email];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'otp': otp, 'email': email};
  }

  factory VerifyParams.fromMap(Map<String, dynamic> map) {
    return VerifyParams(
        otp: map['otp'] as String,
        email: map['email'] as String,
        isEmployee: false);
  }

  String toJson() => json.encode(toMap());

  factory VerifyParams.fromJson(String source) =>
      VerifyParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
