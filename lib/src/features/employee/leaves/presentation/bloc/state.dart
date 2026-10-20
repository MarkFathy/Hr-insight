import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';

part 'state.freezed.dart';

@freezed
sealed class LeavesState with _$LeavesState {
  const factory LeavesState.initial() = LeavesInitialState;
  const factory LeavesState.loading() = LeavesLoadingState;
  const factory LeavesState.loaded({required LeavesEntity leaves}) =
      LeavesLoadedState;
  const factory LeavesState.sent() = LeaveSentState;
  const factory LeavesState.error({required String message}) = LeavesErrorState;
}
