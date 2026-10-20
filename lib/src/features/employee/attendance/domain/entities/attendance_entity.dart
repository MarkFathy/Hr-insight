import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart' as intl;

part 'attendance_entity.freezed.dart';
part 'attendance_entity.g.dart';

@freezed
abstract class AttendanceEntity with _$AttendanceEntity {
  const AttendanceEntity._();

  const factory AttendanceEntity({
    int? status,
    String? message,
    List<AttendanceDataEntity>? data,
  }) = _AttendanceEntity;

  factory AttendanceEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory AttendanceEntity.fromMap(Map<String, dynamic> map) =>
      AttendanceEntity.fromJson(map);

  static AttendanceEntity fromRawJson(String str) =>
      AttendanceEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

@freezed
abstract class AttendanceDataEntity with _$AttendanceDataEntity {
  const AttendanceDataEntity._();

  const factory AttendanceDataEntity({
    int? id,
    String? date,
    @JsonKey(name: 'employee_id') int? employeeId,
    @JsonKey(name: 'attendance_time') String? attendanceTime,
    @JsonKey(name: 'departure_time') String? departureTime,
    double? lat,
    double? lng,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _AttendanceDataEntity;

  factory AttendanceDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataEntityFromJson(json);

  Map<String, dynamic> toMap() => toJson();

  factory AttendanceDataEntity.fromMap(Map<String, dynamic> map) =>
      AttendanceDataEntity.fromJson(map);

  static AttendanceDataEntity fromRawJson(String str) =>
      AttendanceDataEntity.fromJson(json.decode(str) as Map<String, dynamic>);

  String? getAdjustedAttendanceTime() {
    if (attendanceTime != null) {
      final parsedTime = intl.DateFormat('HH:mm:ss').parse(attendanceTime!);
      final adjustedTime = parsedTime.add(const Duration(hours: 3));
      return intl.DateFormat('HH:mm:ss').format(adjustedTime);
    }
    return null;
  }
}
