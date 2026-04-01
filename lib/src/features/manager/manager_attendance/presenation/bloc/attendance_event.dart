import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';

@immutable
abstract class ManagerAttendanceEvent extends Equatable {}

class LoadManagerAttendanceEvent extends ManagerAttendanceEvent {
  final ManagerAttendanceParams params;

  LoadManagerAttendanceEvent(this.params);
  @override
  List<Object?> get props => [params];
}
