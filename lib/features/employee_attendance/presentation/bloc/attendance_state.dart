import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';

part 'attendance_state.freezed.dart';

@freezed
sealed class AttendanceState with _$AttendanceState {
  const factory AttendanceState.initial() = AttendanceInitialState;
  const factory AttendanceState.loading() = AttendanceLoadingState;
  const factory AttendanceState.loaded({required AttendanceEntity attendance}) =
      AttendanceLoadedState;
  const factory AttendanceState.signed({required String message}) =
      AttendanceSignedState;
  const factory AttendanceState.error({required String message}) =
      AttendanceErrorState;
}
