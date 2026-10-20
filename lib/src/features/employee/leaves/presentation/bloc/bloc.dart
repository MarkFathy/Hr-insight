import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/src/features/employee/leaves/domain/use_cases/request_leave.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/event.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/state.dart';

export 'event.dart';
export 'state.dart';

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
  final GetLeavesUC getLeavesUC;
  final RequestLeaveUC requestLeaveUC;

  LeavesBloc({required this.getLeavesUC, required this.requestLeaveUC})
    : super(const LeavesState.initial()) {
    on<GetLeavesEvent>(_getLeaves);
    on<RequestLeaveEvent>(_requestLeave);
  }

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
    final failureOrSections = await getLeavesUC.call();
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
    final failureOrSections = await requestLeaveUC.call(
      LeaveParams(notes: notesCtrl.text, from: start, to: end, leaveType: type),
    );
    emit(
      failureOrSections.fold(
        (failure) => LeavesState.error(message: failure.message),
        (_) => const LeavesState.sent(),
      ),
    );
  }

  @override
  Future<void> close() {
    notesCtrl.dispose();
    return super.close();
  }
}
