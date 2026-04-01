import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_event.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_state.dart';

class ManagerAttendanceBloc
    extends Bloc<ManagerAttendanceEvent, ManagerAttendanceState> {
  final GetManagerAttendanceUC getManagerAttendanceUC;
  ManagerAttendanceBloc({required this.getManagerAttendanceUC})
      : super(ManagerAttendanceStateInitial()) {
    on<LoadManagerAttendanceEvent>(_getAttendance);
  }
  ManagerAttendanceModel? attendance;
  FutureOr<void> _getAttendance(LoadManagerAttendanceEvent event,
      Emitter<ManagerAttendanceState> emit) async {
    emit(ManagerAttendanceStateLoading());
    final failureOrSections = await getManagerAttendanceUC.call(event.params);
    emit(failureOrSections.fold((l) => ManagerAttendanceStateError(l.message),
        (r) {
      attendance = r;
      return ManagerAttendanceStateLoaded(attendance: r);
    }));
  }
}
