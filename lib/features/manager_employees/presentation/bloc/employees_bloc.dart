import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager_employees/domain/usecases/delete_employee.dart';
import 'package:hr_app/features/manager_employees/domain/usecases/get_employees.dart';
import 'package:hr_app/features/manager_employees/presentation/bloc/employees_event.dart';
import 'package:hr_app/features/manager_employees/presentation/bloc/employees_state.dart';

export 'employees_event.dart';
export 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetEmployees getEmployees;
  final DeleteEmployee deleteEmployee;

  EmployeesBloc({
    GetEmployees? getEmployees,
    DeleteEmployee? deleteEmployee,
    GetEmployeesUC? getEmployeesUC,
    DeleteEmployeeUC? deleteOfficeUC,
  }) : getEmployees = getEmployees ?? getEmployeesUC!,
       deleteEmployee = deleteEmployee ?? deleteOfficeUC!,
       super(const EmployeesState.initial()) {
    on<GetEmployeesEvent>(_getEmployees);
    on<DeleteEmployeeEvent>(_deleteEmployee);
  }

  // Legacy getters
  GetEmployees get getEmployeesUC => getEmployees;
  DeleteEmployee get deleteOfficeUC => deleteEmployee;

  EmployeesEntity? employees;

  FutureOr<void> _getEmployees(
    GetEmployeesEvent event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(const EmployeesState.loading());
    final failureOrSections = await getEmployees.call();
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
    final failureOrResult = await deleteEmployee.call(event.id);
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
