import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/employee/attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/src/features/employee/attendance/domain/use_cases/sign.dart';
part 'event.dart';
part 'state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final GetAttendanceUC getAttendanceUC;
  final SignUC signUC;
  AttendanceBloc({required this.getAttendanceUC, required this.signUC})
      : super(AttendanceInitialState()) {
    on<GetAttendanceEvent>(_getAttendance);
    on<SignEvent>(_sign);
  }
  AttendanceModel? attendance;
  FutureOr<void> _getAttendance(
      GetAttendanceEvent event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoadingState());
    final failureOrSections = await getAttendanceUC.call(NoParams());
    emit(failureOrSections.fold((l) => AttendanceErrorState(message: l.message),
        (r) {
      attendance = r;
      return AttendanceLoadedState(attendance: r);
    }));
  }

  FutureOr<void> _sign(SignEvent event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoadingState());
    final failureOrSections = await signUC.call(event.isAttend);
    emit(failureOrSections.fold((l) => AttendanceErrorState(message: l.message),
        (r) => AttendanceSignedState(message: r.message!)));
  }
}
