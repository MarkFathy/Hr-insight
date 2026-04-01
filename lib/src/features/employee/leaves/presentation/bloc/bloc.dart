import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/request_leave.dart';
part 'event.dart';
part 'state.dart';

enum LeaveType { medical, annual, casual }

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final GetLeavesUC getLeavesUC;
  final RequestLeaveUC requestLeaveUC;
  LeavesBloc({required this.getLeavesUC, required this.requestLeaveUC})
      : super(LeavesInitialState()) {
    on<GetLeavesEvent>(_getLeaves);
    on<RequestLeaveEvent>(_requestLeave);
  }
  LeavesModel? attendance;
  final notesCtrl = TextEditingController();
  DateTime? start;
  DateTime? end;
  String? type;
  bool get validateLeaveForm => start != null && end != null;
  FutureOr<void> _getLeaves(
      GetLeavesEvent event, Emitter<LeavesState> emit) async {
    emit(LeavesLoadingState());
    final failureOrSections = await getLeavesUC.call(NoParams());
    emit(failureOrSections.fold((l) => LeavesErrorState(message: l.message),
        (r) {
      attendance = r;
      return LeavesLoadedState(leaves: r);
    }));
  }

  FutureOr<void> _requestLeave(
      RequestLeaveEvent event, Emitter<LeavesState> emit) async {
    emit(LeavesLoadingState());
    final failureOrSections = await requestLeaveUC.call(LeaveParams(
        notes: notesCtrl.text, from: start, to: end, leaveType: type));
    emit(failureOrSections.fold(
        (l) => LeavesErrorState(message: l.message), (r) => LeaveSentState()));
  }
}
