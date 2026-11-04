import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offices_entity.freezed.dart';
part 'offices_entity.g.dart';

double? _radiusFromJson(dynamic val) {
  if (val case final num n) {
    final numVal = n.toDouble();
    final adjusted = numVal >= 1700 ? numVal - 1700 : numVal;
    return double.parse(adjusted.toStringAsFixed(2));
  }
  return null;
}

@freezed
abstract class OfficesEntity with _$OfficesEntity {
  const OfficesEntity._();

  const factory OfficesEntity({
    int? status,
    String? message,
    List<OfficeDataEntity>? data,
  }) = _OfficesEntity;

  factory OfficesEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficesEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory OfficesEntity.fromMap(Map<String, dynamic> map) =>
      OfficesEntity.fromJson(map);

  static OfficesEntity fromRawJson(String str) =>
      OfficesEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class OfficeDataEntity with _$OfficeDataEntity {
  const OfficeDataEntity._();

  const factory OfficeDataEntity({
    int? id,
    String? name,
    double? lat,
    double? lng,
    @JsonKey(fromJson: _radiusFromJson) double? radius,
    @JsonKey(name: 'manager_id') int? managerId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'employees_count') int? employeeCount,
  }) = _OfficeDataEntity;

  factory OfficeDataEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory OfficeDataEntity.fromMap(Map<String, dynamic> map) =>
      OfficeDataEntity.fromJson(map);

  static OfficeDataEntity fromRawJson(String str) =>
      OfficeDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
