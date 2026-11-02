import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
sealed class DepartmentsAndJobsEvent with _$DepartmentsAndJobsEvent {
  const factory DepartmentsAndJobsEvent.getDepartmentsAndJobs() =
      GetDepartmentsAndJobsEvent;
  const factory DepartmentsAndJobsEvent.addDepartment() = AddDepartmentEvent;
  const factory DepartmentsAndJobsEvent.editDepartment({required int id}) =
      EditDepartmentEvent;
  const factory DepartmentsAndJobsEvent.deleteDepartments(int id) =
      DeleteDepartmentsEvent;
  const factory DepartmentsAndJobsEvent.addJob(int departmentId) = AddJobEvent;
  const factory DepartmentsAndJobsEvent.editJob({
    required int jobId,
    required int departmentId,
  }) = EditJobEvent;
  const factory DepartmentsAndJobsEvent.deleteJob(int id) = DeleteJobEvent;
}
