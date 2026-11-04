import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/get_attendance.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/sign_attendance.dart';
import 'package:hr_app/features/employee_attendance/presentation/bloc/attendance_event.dart';
import 'package:hr_app/features/employee_attendance/presentation/bloc/attendance_state.dart';

export 'attendance_event.dart';
export 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final GetAttendance getAttendance;
  final SignAttendance signAttendance;

  AttendanceBloc({
    GetAttendance? getAttendance,
    SignAttendance? signAttendance,
    GetAttendance? getAttendanceUC,
    SignAttendance? signUC,
  }) : getAttendance = getAttendance ?? getAttendanceUC!,
       signAttendance = signAttendance ?? signUC!,
       super(const AttendanceState.initial()) {
    on<GetAttendanceEvent>(_getAttendance);
    on<SignEvent>(_sign);
  }

  // Alias getters for backward compatibility
  GetAttendance get getAttendanceUC => getAttendance;
  SignAttendance get signUC => signAttendance;

  AttendanceEntity? attendance;

  FutureOr<void> _getAttendance(
    GetAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(const AttendanceState.loading());
    final failureOrSections = await getAttendance.call();
    emit(
      failureOrSections.fold(
        (failure) => AttendanceState.error(message: failure.message),
        (result) {
          attendance = result;
          return AttendanceState.loaded(attendance: result);
        },
      ),
    );
  }

  FutureOr<void> _sign(SignEvent event, Emitter<AttendanceState> emit) async {
    emit(const AttendanceState.loading());
    final failureOrSections = await signAttendance.call(
      isAttend: event.isAttend,
      attendanceId: event.attendanceId,
      date: event.date,
    );
    await failureOrSections.fold(
      (failure) async {
        emit(AttendanceState.error(message: failure.message));
      },
      (result) async {
        emit(AttendanceState.signed(message: result.message ?? ''));
        final freshAttendance = await getAttendance.call();
        freshAttendance.fold((_) {}, (updated) {
          attendance = updated;
          emit(AttendanceState.loaded(attendance: updated));
        });
      },
    );
  }
}
