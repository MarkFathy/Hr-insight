import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/delete_employee_use_case.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/get_employees_use_case.dart';
import 'package:hr_app/features/manager/employees/presentation/bloc/event.dart';
import 'package:hr_app/features/manager/employees/presentation/bloc/state.dart';

export 'event.dart';
export 'state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetEmployeesUC getEmployeesUC;
  final DeleteEmployeeUC deleteOfficeUC;

  EmployeesBloc({required this.getEmployeesUC, required this.deleteOfficeUC})
    : super(const EmployeesState.initial()) {
    on<GetEmployeesEvent>(_getEmployees);
    on<DeleteEmployeeEvent>(_deleteEmployee);
  }

  EmployeesEntity? employees;

  FutureOr<void> _getEmployees(
    GetEmployeesEvent event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(const EmployeesState.loading());
    final failureOrSections = await getEmployeesUC.call();
    emit(
      failureOrSections.fold(
        (failure) => EmployeesState.error(message: failure.message),
        (result) {
          employees = result;
          return EmployeesState.loaded(employees: result);
        },
      ),
    );
  }

  FutureOr<void> _deleteEmployee(
    DeleteEmployeeEvent event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(const EmployeesState.loading());
    final failureOrResult = await deleteOfficeUC.call(event.id);
    emit(
      failureOrResult.fold(
        (failure) => EmployeesState.error(message: failure.message),
        (result) {
          add(const EmployeesEvent.getEmployees());
          return const EmployeesState.modified(message: 'Employee deleted');
        },
      ),
    );
  }
}
