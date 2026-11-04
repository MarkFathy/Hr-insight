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

  AttendanceDataEntity? getTodayRecord([DateTime? date]) {
    final targetDate = intl.DateFormat(
      'yyyy-MM-dd',
    ).format(date ?? DateTime.now());
    final records = data?.where((r) => r.date == targetDate).toList();
    if (records == null || records.isEmpty) return null;
    AttendanceDataEntity? signedOutRecord;
    for (final r in records) {
      final dep = r.departureTime?.trim();
      if (dep != null && dep.isNotEmpty && dep != 'null' && dep != '00:00:00') {
        signedOutRecord = r;
        break;
      }
    }
    if (signedOutRecord != null) {
      AttendanceDataEntity? recordWithAttendance;
      for (final r in records) {
        final att = r.attendanceTime?.trim();
        if (att != null && att.isNotEmpty && att != 'null') {
          recordWithAttendance = r;
          break;
        }
      }
      return signedOutRecord.copyWith(
        attendanceTime:
            signedOutRecord.attendanceTime ??
            recordWithAttendance?.attendanceTime,
      );
    }
    return records.last;
  }
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

  String? getAdjustedAttendanceTime({String pattern = 'hh:mm a'}) =>
      formatServerTime(
        time: attendanceTime,
        date: date,
        isoTimestamp: createdAt,
        pattern: pattern,
      );

  String? getAdjustedDepartureTime({String pattern = 'hh:mm a'}) =>
      formatServerTime(
        time: departureTime,
        date: date,
        isoTimestamp: updatedAt,
        pattern: pattern,
      );

  static String? formatServerTime({
    required String? time,
    String? date,
    String? isoTimestamp,
    String pattern = 'hh:mm a',
  }) {
    if (time == null || time.trim().isEmpty) return null;
    final trimmed = time.trim();
    if (trimmed.contains('T')) {
      final parsed = DateTime.tryParse(trimmed);
      if (parsed != null) {
        return intl.DateFormat(pattern, 'en').format(parsed.toLocal());
      }
    }
    try {
      final effectiveDate =
          date ?? intl.DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
      final parts = time.trim().split(':');
      final h = int.parse(parts.isNotEmpty ? parts[0] : '0');
      final m = int.parse(parts.length > 1 ? parts[1] : '0');
      final s = int.parse(parts.length > 2 ? parts[2].split('.').first : '0');

      final dateParts = effectiveDate.split('-');
      final year = int.parse(dateParts[0]);
      final month = int.parse(dateParts[1]);
      final day = int.parse(dateParts[2]);

      var isAlreadyLocal = false;
      if (isoTimestamp != null && isoTimestamp.isNotEmpty) {
        final parsedIso = DateTime.tryParse(isoTimestamp);
        if (parsedIso != null) {
          final utcIso = parsedIso.toUtc();
          final localIso = parsedIso.toLocal();

          final timeMinutes = h * 60 + m;
          final utcMinutes = utcIso.hour * 60 + utcIso.minute;
          final localMinutes = localIso.hour * 60 + localIso.minute;

          int diffMinutes(int a, int b) {
            final diff = (a - b).abs();
            return diff > 720 ? 1440 - diff : diff;
          }

          final diffToUtc = diffMinutes(timeMinutes, utcMinutes);
          final diffToLocal = diffMinutes(timeMinutes, localMinutes);

          if (diffToLocal < diffToUtc && diffToLocal <= 60) {
            isAlreadyLocal = true;
          }
        }
      }

      final targetDateTime = isAlreadyLocal
          ? DateTime(year, month, day, h, m, s)
          : DateTime.utc(year, month, day, h, m, s).toLocal();

      return intl.DateFormat(pattern, 'en').format(targetDateTime);
    } on Object catch (_) {
      return time;
    }
  }
}
