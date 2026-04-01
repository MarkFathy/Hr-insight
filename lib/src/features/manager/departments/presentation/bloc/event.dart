part of 'bloc.dart';

abstract class DepartmentsAndJobsEvent extends Equatable {
  const DepartmentsAndJobsEvent();

  @override
  List<Object> get props => [];
}

class GetDepartmentsAndJobsEvent extends DepartmentsAndJobsEvent {
  const GetDepartmentsAndJobsEvent();
  @override
  List<Object> get props => [];
}

class AddDepartmentEvent extends DepartmentsAndJobsEvent {
  const AddDepartmentEvent();
  @override
  List<Object> get props => [];
}

class EditDepartmentEvent extends DepartmentsAndJobsEvent {
  final int id;

  const EditDepartmentEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class DeleteDepartmentsEvent extends DepartmentsAndJobsEvent {
  final int id;
  const DeleteDepartmentsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class AddJobEvent extends DepartmentsAndJobsEvent {
  final int departmentId;
  const AddJobEvent(this.departmentId);
  @override
  List<Object> get props => [departmentId];
}

class EditJobEvent extends DepartmentsAndJobsEvent {
  final int jobId;
  final int departmentId;

  const EditJobEvent({required this.jobId, required this.departmentId});
  @override
  List<Object> get props => [jobId, departmentId];
}

class DeleteJobEvent extends DepartmentsAndJobsEvent {
  final int id;
  const DeleteJobEvent(this.id);
  @override
  List<Object> get props => [id];
}
