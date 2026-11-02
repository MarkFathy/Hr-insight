import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/features/employee/attendance/domain/use_cases/sign_attendance_use_case.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/event.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/state.dart';

export 'event.dart';
export 'state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final GetAttendanceUC getAttendanceUC;
  final SignUC signUC;

  AttendanceBloc({required this.getAttendanceUC, required this.signUC})
    : super(const AttendanceState.initial()) {
    on<GetAttendanceEvent>(_getAttendance);
    on<SignEvent>(_sign);
  }

  AttendanceEntity? attendance;

  FutureOr<void> _getAttendance(
    GetAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(const AttendanceState.loading());
    final failureOrSections = await getAttendanceUC.call();
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
    final failureOrSections = await signUC.call(isAttend: event.isAttend);
    emit(
      failureOrSections.fold(
        (failure) => AttendanceState.error(message: failure.message),
        (result) => AttendanceState.signed(message: result.message ?? ''),
      ),
    );
  }
}
