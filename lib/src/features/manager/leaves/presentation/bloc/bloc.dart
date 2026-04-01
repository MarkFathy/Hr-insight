import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/src/features/manager/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/src/features/manager/leaves/domain/use_cases/set_leave.dart';
part 'event.dart';
part 'state.dart';

enum LeaveType { medical, annual, casual }

class ManagerLeavesBloc extends Bloc<ManagerLeavesEvent, ManagerLeavesState> {
  final GetManagerLeavesUC getLeavesUC;
  final SetLeaveUC setLeaveStateUC;
  ManagerLeavesBloc({required this.getLeavesUC, required this.setLeaveStateUC})
      : super(ManagerLeavesInitialState()) {
    on<GetManagerLeavesEvent>(_getLeaves);
    on<SetLeaveEvent>(_setLeaveState);
  }
  LeavesModel? leaves;
  FutureOr<void> _getLeaves(
      GetManagerLeavesEvent event, Emitter<ManagerLeavesState> emit) async {
    emit(ManagerLeavesLoadingState());
    final failureOrSections = await getLeavesUC.call(NoParams());
    emit(failureOrSections.fold((l) => LeavesErrorState(message: l.message),
        (r) {
      leaves = r;
      return ManagerLeavesLoadedState(leaves: r);
    }));
  }

  FutureOr<void> _setLeaveState(
      SetLeaveEvent event, Emitter<ManagerLeavesState> emit) async {
    emit(ManagerLeavesLoadingState());
    final failureOrSections = await setLeaveStateUC.call(event.params);
    emit(failureOrSections.fold((l) => LeavesErrorState(message: l.message),
        (r) => ManagerLeavesLoadedState(leaves: r)));
  }
}
