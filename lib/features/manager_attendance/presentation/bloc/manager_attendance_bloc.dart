import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager_attendance/domain/usecases/get_manager_attendance.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_event.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_state.dart';

export 'manager_attendance_event.dart';
export 'manager_attendance_state.dart';

class ManagerAttendanceBloc
    extends Bloc<ManagerAttendanceEvent, ManagerAttendanceState> {
  final GetManagerAttendance getManagerAttendance;

  ManagerAttendanceBloc({
    GetManagerAttendance? getManagerAttendance,
    GetManagerAttendance? getManagerAttendanceUC,
  }) : getManagerAttendance = getManagerAttendance ?? getManagerAttendanceUC!,
       super(const ManagerAttendanceState.initial()) {
    on<LoadManagerAttendanceEvent>(_getAttendance);
  }

  // Backward-compatible getter
  GetManagerAttendance get getManagerAttendanceUC => getManagerAttendance;

  ManagerAttendanceEntity? attendance;

  FutureOr<void> _getAttendance(
    LoadManagerAttendanceEvent event,
    Emitter<ManagerAttendanceState> emit,
  ) async {
    emit(const ManagerAttendanceState.loading());
    final failureOrSections = await getManagerAttendance.call(event.params);
    emit(
      failureOrSections.fold(
        (failure) => ManagerAttendanceState.error(failure.message),
        (result) {
          attendance = result;
          return ManagerAttendanceState.loaded(attendance: result);
        },
      ),
    );
  }
}
