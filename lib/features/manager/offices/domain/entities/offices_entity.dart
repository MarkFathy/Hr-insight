import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offices_entity.freezed.dart';
part 'offices_entity.g.dart';

double? _radiusFromJson(dynamic val) {
  if (val == null) return null;
  final numVal = (val as num).toDouble();
  if (numVal >= 1700) {
    return double.parse((numVal - 1700).toStringAsFixed(2));
  }
  return double.parse(numVal.toStringAsFixed(2));
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
