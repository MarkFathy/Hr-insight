import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';

part 'employees_state.freezed.dart';

@freezed
sealed class EmployeesState with _$EmployeesState {
  const factory EmployeesState.initial() = EmployeesInitialState;
  const factory EmployeesState.loading() = EmployeesLoadingState;
  const factory EmployeesState.loaded({required EmployeesEntity employees}) =
      EmployeesLoadedState;
  const factory EmployeesState.modified({String? message}) =
      EmployeesModifiedState;
  const factory EmployeesState.error({required String message}) =
      EmployeesErrorState;
}
