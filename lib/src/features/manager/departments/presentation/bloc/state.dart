part of 'bloc.dart';

abstract class DepartmentsAndJobsState extends Equatable {
  const DepartmentsAndJobsState();

  @override
  List<Object> get props => [];
}

class DepartmentsInitialState extends DepartmentsAndJobsState {}

class DepartmentsLoadingState extends DepartmentsAndJobsState {}

class DepartmentsLoadedState extends DepartmentsAndJobsState {
  final DepartmentsEntity departments;

  const DepartmentsLoadedState({required this.departments});

  @override
  List<Object> get props => [departments];
}

class DepartmentsModifiedState extends DepartmentsAndJobsState {
  final String? message;

  const DepartmentsModifiedState({this.message});
}

class DepartmentsErrorState extends DepartmentsAndJobsState {
  final String message;

  const DepartmentsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
