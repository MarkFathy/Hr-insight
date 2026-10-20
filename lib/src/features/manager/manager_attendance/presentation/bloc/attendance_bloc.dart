import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/bloc/attendance_event.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/bloc/attendance_state.dart';

export 'attendance_event.dart';
export 'attendance_state.dart';

class ManagerAttendanceBloc
    extends Bloc<ManagerAttendanceEvent, ManagerAttendanceState> {
  final GetManagerAttendanceUC getManagerAttendanceUC;

  ManagerAttendanceBloc({required this.getManagerAttendanceUC})
    : super(const ManagerAttendanceState.initial()) {
    on<LoadManagerAttendanceEvent>(_getAttendance);
  }

  ManagerAttendanceEntity? attendance;

  FutureOr<void> _getAttendance(
    LoadManagerAttendanceEvent event,
    Emitter<ManagerAttendanceState> emit,
  ) async {
    emit(const ManagerAttendanceState.loading());
    final failureOrSections = await getManagerAttendanceUC.call(event.params);
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
