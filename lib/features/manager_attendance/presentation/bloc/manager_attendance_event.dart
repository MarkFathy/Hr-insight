import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';

part 'manager_attendance_event.freezed.dart';

@freezed
sealed class ManagerAttendanceEvent with _$ManagerAttendanceEvent {
  const factory ManagerAttendanceEvent.load(ManagerAttendanceParams params) =
      LoadManagerAttendanceEvent;
}
