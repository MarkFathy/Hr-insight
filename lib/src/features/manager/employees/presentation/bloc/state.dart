part of 'bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesInitialState extends EmployeesState {}

class EmployeesLoadingState extends EmployeesState {}

class EmployeesLoadedState extends EmployeesState {
  final EmployeesEntity employees;

  const EmployeesLoadedState({required this.employees});

  @override
  List<Object> get props => [employees];
}

// class OfficeDetailsLoadedState extends EmployeesState {
//   final OfficeDetailsEntity details;

//   const OfficeDetailsLoadedState({required this.details});

//   @override
//   List<Object> get props => [details];
// }

class EmployeesModifiedState extends EmployeesState {
  final String? message;

  const EmployeesModifiedState({this.message});
}

class EmployeesErrorState extends EmployeesState {
  final String message;

  const EmployeesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
