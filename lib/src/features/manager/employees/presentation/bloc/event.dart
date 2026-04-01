part of 'bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeesEvent extends EmployeesEvent {
  const GetEmployeesEvent();
  @override
  List<Object> get props => [];
}

class AddEmployeeEvent extends EmployeesEvent {
  const AddEmployeeEvent();
  @override
  List<Object> get props => [];
}

class DeleteEmployeeEvent extends EmployeesEvent {
  final int id;
  const DeleteEmployeeEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetEmployeeDetailsEvent extends EmployeesEvent {
  final int id;
  const GetEmployeeDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}
