import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';

part 'employees_entity.freezed.dart';
part 'employees_entity.g.dart';

List<EmployeeDataEntity>? _employeesDataFromJson(dynamic json) {
  if (json == null) return null;
  if (json is List) {
    return json
        .map((e) => EmployeeDataEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  return [];
}

@freezed
abstract class EmployeesEntity with _$EmployeesEntity {
  const EmployeesEntity._();

  const factory EmployeesEntity({
    int? status,
    String? message,
    @JsonKey(fromJson: _employeesDataFromJson) List<EmployeeDataEntity>? data,
  }) = _EmployeesEntity;

  factory EmployeesEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeesEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory EmployeesEntity.fromMap(Map<String, dynamic> map) =>
      EmployeesEntity.fromJson(map);

  static EmployeesEntity fromRawJson(String str) =>
      EmployeesEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
