import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_attendance_entity.freezed.dart';
part 'manager_attendance_entity.g.dart';

@freezed
abstract class ManagerAttendanceEntity with _$ManagerAttendanceEntity {
  const ManagerAttendanceEntity._();

  const factory ManagerAttendanceEntity({
    int? status,
    String? message,
    List<ManagerAttendanceDataEntity>? data,
  }) = _ManagerAttendanceEntity;

  factory ManagerAttendanceEntity.fromJson(Map<String, dynamic> json) =>
      _$ManagerAttendanceEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerAttendanceEntity.fromMap(Map<String, dynamic> map) =>
      ManagerAttendanceEntity.fromJson(map);

  static ManagerAttendanceEntity fromRawJson(String str) =>
      ManagerAttendanceEntity.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );
}

@freezed
abstract class ManagerAttendanceDataEntity with _$ManagerAttendanceDataEntity {
  const ManagerAttendanceDataEntity._();

  const factory ManagerAttendanceDataEntity({
    int? id,
    String? date,
    @JsonKey(name: 'employee_id') int? employeeId,
    @JsonKey(name: 'attendance_time') String? attendanceTime,
    @JsonKey(name: 'departure_time') String? departureTime,
    double? lat,
    double? lng,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ManagerAttendanceDataEntity;

  factory ManagerAttendanceDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ManagerAttendanceDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory ManagerAttendanceDataEntity.fromMap(Map<String, dynamic> map) =>
      ManagerAttendanceDataEntity.fromJson(map);

  static ManagerAttendanceDataEntity fromRawJson(String str) =>
      ManagerAttendanceDataEntity.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );
}
