import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'departments_entity.freezed.dart';
part 'departments_entity.g.dart';

@freezed
abstract class DepartmentsEntity with _$DepartmentsEntity {
  const DepartmentsEntity._();

  const factory DepartmentsEntity({
    int? status,
    String? message,
    List<DepartmentDataEntity>? data,
  }) = _DepartmentsEntity;

  factory DepartmentsEntity.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory DepartmentsEntity.fromMap(Map<String, dynamic> map) =>
      DepartmentsEntity.fromJson(map);

  static DepartmentsEntity fromRawJson(String str) =>
      DepartmentsEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class DepartmentDataEntity with _$DepartmentDataEntity {
  const DepartmentDataEntity._();

  const factory DepartmentDataEntity({
    int? id,
    String? name,
    @JsonKey(name: 'manager_id') int? managerId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'jobs_count') int? jobsCount,
    @JsonKey(name: 'number_of_employees') int? numberOfEmployees,
    List<JobDataEntity>? jobs,
  }) = _DepartmentDataEntity;

  factory DepartmentDataEntity.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory DepartmentDataEntity.fromMap(Map<String, dynamic> map) =>
      DepartmentDataEntity.fromJson(map);

  static DepartmentDataEntity fromRawJson(String str) =>
      DepartmentDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class JobDataEntity with _$JobDataEntity {
  const JobDataEntity._();

  const factory JobDataEntity({
    int? id,
    String? title,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'manager_id') int? managerId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'employees_count') int? employeesCount,
  }) = _JobDataEntity;

  factory JobDataEntity.fromJson(Map<String, dynamic> json) =>
      _$JobDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory JobDataEntity.fromMap(Map<String, dynamic> map) =>
      JobDataEntity.fromJson(map);

  static JobDataEntity fromRawJson(String str) =>
      JobDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
