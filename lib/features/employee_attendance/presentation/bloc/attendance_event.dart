import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_event.freezed.dart';

@freezed
sealed class AttendanceEvent with _$AttendanceEvent {
  const factory AttendanceEvent.getAttendance() = GetAttendanceEvent;
  const factory AttendanceEvent.sign({
    required bool isAttend,
    int? attendanceId,
    String? date,
  }) = SignEvent;
}
