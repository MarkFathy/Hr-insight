import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/get_leaves.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/request_leave.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_event.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_state.dart';

export 'leaves_event.dart';
export 'leaves_state.dart';

enum LeaveType {
  medical('إجازة مرضية'),
  annual('إجازة سنوية'),
  casual('إجازة عارضة');

  final String label;
  const LeaveType(this.label);

  static String toArabic(String? type) => switch (type?.toLowerCase()) {
    'medical' => 'إجازة مرضية',
    'annual' => 'إجازة سنوية',
    'casual' => 'إجازة عارضة',
    final val? when val.isNotEmpty => val,
    _ => 'إجازة عادية',
  };
}

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final GetLeaves getLeaves;
  final RequestLeave requestLeave;

  LeavesBloc({
    GetLeaves? getLeaves,
    RequestLeave? requestLeave,
    GetLeaves? getLeavesUC,
    RequestLeave? requestLeaveUC,
  }) : getLeaves = getLeaves ?? getLeavesUC!,
       requestLeave = requestLeave ?? requestLeaveUC!,
       super(const LeavesState.initial()) {
    on<GetLeavesEvent>(_getLeaves);
    on<RequestLeaveEvent>(_requestLeave);
  }

  // Alias getters for backward compatibility
  GetLeaves get getLeavesUC => getLeaves;
  RequestLeave get requestLeaveUC => requestLeave;

  LeavesEntity? attendance;
  final notesCtrl = TextEditingController();
  DateTime? start;
  DateTime? end;
  String? type;

  bool get validateLeaveForm => start != null && end != null;

  FutureOr<void> _getLeaves(
    GetLeavesEvent event,
    Emitter<LeavesState> emit,
  ) async {
    emit(const LeavesState.loading());
    final failureOrSections = await getLeaves.call();
    emit(
      failureOrSections.fold(
        (failure) => LeavesState.error(message: failure.message),
        (result) {
          attendance = result;
          return LeavesState.loaded(leaves: result);
        },
      ),
    );
  }

  FutureOr<void> _requestLeave(
    RequestLeaveEvent event,
    Emitter<LeavesState> emit,
  ) async {
    emit(const LeavesState.loading());
    final params =
        event.params ??
        LeaveParams(
          notes: notesCtrl.text,
          from: start,
          to: end,
          leaveType: type,
        );
    final failureOrSections = await requestLeave.call(params);
    emit(
      failureOrSections.fold(
        (failure) => LeavesState.error(message: failure.message),
        (_) => const LeavesState.sent(),
      ),
    );
  }
}
