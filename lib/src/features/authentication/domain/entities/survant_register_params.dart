import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

class EmployeeRegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String address;
  final File image;
  final String managerPin;
  final int departmentId;
  final int jobId;
  final int officeId;

  const EmployeeRegisterParams(
      {required this.email,
      required this.name,
      required this.password,
      required this.confirmPassword,
      required this.phone,
      required this.address,
      required this.image,
      required this.managerPin,
      required this.departmentId,
      required this.jobId,
      required this.officeId});

  @override
  List<Object> get props {
    return [
      name,
      email,
      password,
      confirmPassword,
      phone,
      address,
      image,
      managerPin,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'phone': phone,
      'address': address,
      'image': image,
      'manager_pin': managerPin,
      'department_id': departmentId,
      'job_id': jobId,
      'office_id': officeId
    };
  }

  factory EmployeeRegisterParams.fromMap(Map<String, dynamic> map) {
    return EmployeeRegisterParams(
        name: map['name'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        confirmPassword: map['password_confirmation'] as String,
        phone: map['phone'] as String,
        address: map['address'] as String,
        image: map['image'],
        managerPin: map['manager_pin'] as String,
        departmentId: map['department_id'],
        jobId: map['job_id'],
        officeId: map['office_id']);
  }

  String toJson() => json.encode(toMap());

  factory EmployeeRegisterParams.fromJson(String source) =>
      EmployeeRegisterParams.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
