import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';

part 'departments_state.freezed.dart';

@freezed
sealed class DepartmentsState with _$DepartmentsState {
  const factory DepartmentsState.initial() = DepartmentsInitialState;
  const factory DepartmentsState.loading() = DepartmentsLoadingState;
  const factory DepartmentsState.loaded({
    required DepartmentsEntity departments,
  }) = DepartmentsLoadedState;
  const factory DepartmentsState.modified({String? message}) =
      DepartmentsModifiedState;
  const factory DepartmentsState.error({required String message}) =
      DepartmentsErrorState;
}

typedef DepartmentsAndJobsState = DepartmentsState;
