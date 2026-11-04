import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';

part 'manager_leaves_state.freezed.dart';

@freezed
sealed class ManagerLeavesState with _$ManagerLeavesState {
  const factory ManagerLeavesState.initial() = ManagerLeavesInitialState;
  const factory ManagerLeavesState.loading() = ManagerLeavesLoadingState;
  const factory ManagerLeavesState.loaded({required LeavesEntity leaves}) =
      ManagerLeavesLoadedState;
  const factory ManagerLeavesState.sent() = ManagerLeaveSentState;
  const factory ManagerLeavesState.error({required String message}) =
      LeavesErrorState;
}
