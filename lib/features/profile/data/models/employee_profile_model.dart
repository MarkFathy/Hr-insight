import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';

part 'employee_profile_model.freezed.dart';
part 'employee_profile_model.g.dart';

@freezed
abstract class EmployeeProfileModel with _$EmployeeProfileModel {
  const EmployeeProfileModel._();

  const factory EmployeeProfileModel({
    int? status,
    String? message,
    EmployeeDataEntity? data,
  }) = _EmployeeProfileModel;

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeProfileModelFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory EmployeeProfileModel.fromMap(Map<String, dynamic> map) =>
      EmployeeProfileModel.fromJson(map);

  static EmployeeProfileModel fromRawJson(String str) =>
      EmployeeProfileModel.fromJson(json.decode(str) as Map<String, dynamic>);
}
