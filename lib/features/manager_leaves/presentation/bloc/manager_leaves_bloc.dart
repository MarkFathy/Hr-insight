import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/manager_leaves/domain/usecases/get_manager_leaves.dart';
import 'package:hr_app/features/manager_leaves/domain/usecases/set_leave_status.dart';
import 'package:hr_app/features/manager_leaves/presentation/bloc/manager_leaves_event.dart';
import 'package:hr_app/features/manager_leaves/presentation/bloc/manager_leaves_state.dart';

export 'manager_leaves_event.dart';
export 'manager_leaves_state.dart';

class ManagerLeavesBloc extends Bloc<ManagerLeavesEvent, ManagerLeavesState> {
  final GetManagerLeaves getLeaves;
  final SetLeaveStatus setLeaveStatus;

  ManagerLeavesBloc({
    GetManagerLeaves? getLeaves,
    SetLeaveStatus? setLeaveStatus,
    GetManagerLeavesUC? getLeavesUC,
    SetLeaveUC? setLeaveStateUC,
  }) : getLeaves = getLeaves ?? getLeavesUC!,
       setLeaveStatus = setLeaveStatus ?? setLeaveStateUC!,
       super(const ManagerLeavesState.initial()) {
    on<GetManagerLeavesEvent>(_getLeaves);
    on<SetLeaveEvent>(_setLeaveState);
  }

  // Legacy getters
  GetManagerLeaves get getLeavesUC => getLeaves;
  SetLeaveStatus get setLeaveStateUC => setLeaveStatus;

  LeavesEntity? leaves;

  FutureOr<void> _getLeaves(
    GetManagerLeavesEvent event,
    Emitter<ManagerLeavesState> emit,
  ) async {
    emit(const ManagerLeavesState.loading());
    final failureOrSections = await getLeaves.call();
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
    final failureOrSections = await setLeaveStatus.call(event.params);
    emit(
      failureOrSections.fold(
        (failure) => ManagerLeavesState.error(message: failure.message),
        (result) => ManagerLeavesState.loaded(leaves: result),
      ),
    );
  }
}
