import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/set_leave.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/event.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/state.dart';

export 'event.dart';
export 'state.dart';

class ManagerLeavesBloc extends Bloc<ManagerLeavesEvent, ManagerLeavesState> {
  final GetManagerLeavesUC getLeavesUC;
  final SetLeaveUC setLeaveStateUC;

  ManagerLeavesBloc({required this.getLeavesUC, required this.setLeaveStateUC})
    : super(const ManagerLeavesState.initial()) {
    on<GetManagerLeavesEvent>(_getLeaves);
    on<SetLeaveEvent>(_setLeaveState);
  }

  LeavesEntity? leaves;

  FutureOr<void> _getLeaves(
    GetManagerLeavesEvent event,
    Emitter<ManagerLeavesState> emit,
  ) async {
    emit(const ManagerLeavesState.loading());
    final failureOrSections = await getLeavesUC.call();
    emit(
      failureOrSections.fold(
        (failure) => ManagerLeavesState.error(message: failure.message),
        (result) {
          leaves = result;
          return ManagerLeavesState.loaded(leaves: result);
        },
      ),
    );
  }

  FutureOr<void> _setLeaveState(
    SetLeaveEvent event,
    Emitter<ManagerLeavesState> emit,
  ) async {
    emit(const ManagerLeavesState.loading());
    final failureOrSections = await setLeaveStateUC.call(event.params);
    emit(
      failureOrSections.fold(
        (failure) => ManagerLeavesState.error(message: failure.message),
        (result) => ManagerLeavesState.loaded(leaves: result),
      ),
    );
  }
}
