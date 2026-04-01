import 'package:flutter/foundation.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';

@immutable
class ManagerAttendanceState {
  const ManagerAttendanceState() : super();
}

class ManagerAttendanceStateInitial extends ManagerAttendanceState {}

class ManagerAttendanceStateLoading extends ManagerAttendanceState {}

class ManagerAttendanceStateLoaded extends ManagerAttendanceState {
  final ManagerAttendanceModel? attendance;

  const ManagerAttendanceStateLoaded({required this.attendance});
}

class ManagerAttendanceStateError extends ManagerAttendanceState {
  final String message;
  const ManagerAttendanceStateError(this.message);
}
