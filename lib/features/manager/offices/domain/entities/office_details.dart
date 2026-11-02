import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';

part 'office_details.freezed.dart';
part 'office_details.g.dart';

double? _radiusFromJson(dynamic val) {
  if (val case final num n) {
    final numVal = n.toDouble();
    final adjusted = numVal >= 1700 ? numVal - 1700 : numVal;
    return double.parse(adjusted.toStringAsFixed(2));
  }
  return null;
}

@freezed
abstract class OfficeDetailsEntity with _$OfficeDetailsEntity {
  const OfficeDetailsEntity._();

  const factory OfficeDetailsEntity({
    int? status,
    String? message,
    OfficeDetailsDataEntity? data,
  }) = _OfficeDetailsEntity;

  factory OfficeDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficeDetailsEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory OfficeDetailsEntity.fromMap(Map<String, dynamic> map) =>
      OfficeDetailsEntity.fromJson(map);

  static OfficeDetailsEntity fromRawJson(String str) =>
      OfficeDetailsEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class OfficeDetailsDataEntity with _$OfficeDetailsDataEntity {
  const OfficeDetailsDataEntity._();

  const factory OfficeDetailsDataEntity({
    int? id,
    String? name,
    double? lat,
    double? lng,
    @JsonKey(fromJson: _radiusFromJson) double? radius,
    @JsonKey(name: 'manager_id') int? managerId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<EmployeeDataEntity>? employees,
  }) = _OfficeDetailsDataEntity;

  factory OfficeDetailsDataEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficeDetailsDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory OfficeDetailsDataEntity.fromMap(Map<String, dynamic> map) =>
      OfficeDetailsDataEntity.fromJson(map);

  static OfficeDetailsDataEntity fromRawJson(String str) =>
      OfficeDetailsDataEntity.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );
}
