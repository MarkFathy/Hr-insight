import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';

part 'attendance_state.freezed.dart';

@freezed
sealed class ManagerAttendanceState with _$ManagerAttendanceState {
  const factory ManagerAttendanceState.initial() =
      ManagerAttendanceStateInitial;
  const factory ManagerAttendanceState.loading() =
      ManagerAttendanceStateLoading;
  const factory ManagerAttendanceState.loaded({
    required ManagerAttendanceEntity? attendance,
  }) = ManagerAttendanceStateLoaded;
  const factory ManagerAttendanceState.error(String message) =
      ManagerAttendanceStateError;
}
