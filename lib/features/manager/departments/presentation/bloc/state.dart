import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';

part 'state.freezed.dart';

@freezed
sealed class DepartmentsAndJobsState with _$DepartmentsAndJobsState {
  const factory DepartmentsAndJobsState.initial() = DepartmentsInitialState;
  const factory DepartmentsAndJobsState.loading() = DepartmentsLoadingState;
  const factory DepartmentsAndJobsState.loaded({
    required DepartmentsEntity departments,
  }) = DepartmentsLoadedState;
  const factory DepartmentsAndJobsState.modified({String? message}) =
      DepartmentsModifiedState;
  const factory DepartmentsAndJobsState.error({required String message}) =
      DepartmentsErrorState;
}
