import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';

part 'manager_info_entity.freezed.dart';
part 'manager_info_entity.g.dart';

@freezed
abstract class ManagerInfoEntity with _$ManagerInfoEntity {
  const ManagerInfoEntity._();

  const factory ManagerInfoEntity({
    int? status,
    String? message,
    ManageInfoDataEntity? data,
  }) = _ManagerInfoEntity;

  factory ManagerInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ManagerInfoEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerInfoEntity.fromMap(Map<String, dynamic> map) =>
      ManagerInfoEntity.fromJson(map);

  static ManagerInfoEntity fromRawJson(String str) =>
      ManagerInfoEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class ManageInfoDataEntity with _$ManageInfoDataEntity {
  const ManageInfoDataEntity._();

  const factory ManageInfoDataEntity({
    required ManagerDataEntity manager,
    @Default([]) List<DepartmentDataEntity> departments,
    @Default([]) List<OfficeDataEntity> offices,
  }) = _ManageInfoDataEntity;

  factory ManageInfoDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ManageInfoDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManageInfoDataEntity.fromMap(Map<String, dynamic> map) =>
      ManageInfoDataEntity.fromJson(map);

  static ManageInfoDataEntity fromRawJson(String str) =>
      ManageInfoDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
