import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';

part 'employee_entity.freezed.dart';
part 'employee_entity.g.dart';

@freezed
abstract class EmployeeEntity with _$EmployeeEntity {
  const EmployeeEntity._();

  const factory EmployeeEntity({
    int? status,
    String? message,
    UserDataEntity? data,
  }) = _EmployeeEntity;

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory EmployeeEntity.fromMap(Map<String, dynamic> map) =>
      EmployeeEntity.fromJson(map);

  static EmployeeEntity fromRawJson(String str) =>
      EmployeeEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class UserDataEntity with _$UserDataEntity {
  const UserDataEntity._();

  const factory UserDataEntity({
    String? token,
    @JsonKey(name: 'data') EmployeeDataEntity? employee,
  }) = _UserDataEntity;

  factory UserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory UserDataEntity.fromMap(Map<String, dynamic> map) =>
      UserDataEntity.fromJson(map);

  static UserDataEntity fromRawJson(String str) =>
      UserDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class EmployeeDataEntity with _$EmployeeDataEntity {
  const EmployeeDataEntity._();

  const factory EmployeeDataEntity({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? image,
    @JsonKey(name: 'UID') String? uID,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    int? id,
    ManagerDataEntity? manager,
    JobEntity? job,
    DepartmentDataEntity? department,
    OfficeDataEntity? office,
  }) = _EmployeeDataEntity;

  factory EmployeeDataEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory EmployeeDataEntity.fromMap(Map<String, dynamic> map) =>
      EmployeeDataEntity.fromJson(map);

  static EmployeeDataEntity fromRawJson(String str) =>
      EmployeeDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class JobEntity with _$JobEntity {
  const JobEntity._();

  const factory JobEntity({
    int? id,
    String? title,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _JobEntity;

  factory JobEntity.fromJson(Map<String, dynamic> json) =>
      _$JobEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory JobEntity.fromMap(Map<String, dynamic> map) =>
      JobEntity.fromJson(map);

  static JobEntity fromRawJson(String str) =>
      JobEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
