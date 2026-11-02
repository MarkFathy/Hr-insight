import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaves_entity.freezed.dart';
part 'leaves_entity.g.dart';

List<LeavesDataEntity>? _leavesDataFromJson(dynamic json) => switch (json) {
  final List<dynamic> list =>
    list
        .map((e) => LeavesDataEntity.fromJson(e as Map<String, dynamic>))
        .toList(),
  final Map<dynamic, dynamic> map => [
    LeavesDataEntity.fromJson(
      map is Map<String, dynamic> ? map : Map<String, dynamic>.from(map),
    ),
  ],
  _ => null,
};

@freezed
abstract class LeavesEntity with _$LeavesEntity {
  const LeavesEntity._();

  const factory LeavesEntity({
    int? status,
    String? message,
    @JsonKey(fromJson: _leavesDataFromJson) List<LeavesDataEntity>? data,
  }) = _LeavesEntity;

  factory LeavesEntity.fromJson(Map<String, dynamic> json) =>
      _$LeavesEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory LeavesEntity.fromMap(Map<String, dynamic> map) =>
      LeavesEntity.fromJson(map);

  static LeavesEntity fromRawJson(String str) =>
      LeavesEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class LeavesDataEntity with _$LeavesDataEntity {
  const LeavesDataEntity._();

  const factory LeavesDataEntity({
    int? id,
    @JsonKey(name: 'employee_id') int? employeeId,
    @JsonKey(name: 'manager_id') int? managerId,
    @JsonKey(name: 'day_date') DateTime? dayDate,
    DateTime? from,
    DateTime? to,
    @JsonKey(name: 'leave_type') String? leaveType,
    String? status,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _LeavesDataEntity;

  factory LeavesDataEntity.fromJson(Map<String, dynamic> json) =>
      _$LeavesDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory LeavesDataEntity.fromMap(Map<String, dynamic> map) =>
      LeavesDataEntity.fromJson(map);

  static LeavesDataEntity fromRawJson(String str) =>
      LeavesDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}
