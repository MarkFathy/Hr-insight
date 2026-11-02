import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_register_params.freezed.dart';

@freezed
abstract class EmployeeRegisterParams with _$EmployeeRegisterParams {
  const EmployeeRegisterParams._();

  const factory EmployeeRegisterParams({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String address,
    required File image,
    required String managerPin,
    required int departmentId,
    required int jobId,
    required int officeId,
  }) = _EmployeeRegisterParams;

  Map<String, dynamic> toMap() => <String, dynamic>{
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
    'office_id': officeId,
  };
}
