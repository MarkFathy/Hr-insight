import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
sealed class EmployeesEvent with _$EmployeesEvent {
  const factory EmployeesEvent.getEmployees() = GetEmployeesEvent;
  const factory EmployeesEvent.addEmployee() = AddEmployeeEvent;
  const factory EmployeesEvent.deleteEmployee(int id) = DeleteEmployeeEvent;
  const factory EmployeesEvent.getEmployeeDetails(int id) =
      GetEmployeeDetailsEvent;
}
