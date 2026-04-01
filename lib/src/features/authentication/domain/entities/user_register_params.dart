import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

class ManagerRegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String companyName;
  final File image;

  const ManagerRegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.companyName,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      name,
      email,
      password,
      passwordConfirmation,
      phone,
      companyName,
      image,
    ];
  }

  factory ManagerRegisterParams.fromMap(Map<String, dynamic> map) {
    return ManagerRegisterParams(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      passwordConfirmation: map['password_confirmation'] as String,
      phone: map['phone'] as String,
      companyName: map['company_name'] as String,
      image: map['image'],
    );
  }

  factory ManagerRegisterParams.fromJson(String source) =>
      ManagerRegisterParams.fromMap(
          json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'company_name': companyName,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
