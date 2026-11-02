import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_register_params.freezed.dart';

@freezed
abstract class ManagerRegisterParams with _$ManagerRegisterParams {
  const ManagerRegisterParams._();

  const factory ManagerRegisterParams({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String companyName,
    required File image,
  }) = _ManagerRegisterParams;

  Map<String, dynamic> toMap() => <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'company_name': companyName,
      'image': image,
    };
}
