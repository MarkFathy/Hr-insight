import 'package:freezed_annotation/freezed_annotation.dart';

part 'departments_event.freezed.dart';

@freezed
sealed class DepartmentsEvent with _$DepartmentsEvent {
  const factory DepartmentsEvent.getDepartmentsAndJobs() =
      GetDepartmentsAndJobsEvent;
  const factory DepartmentsEvent.addDepartment({String? name}) =
      AddDepartmentEvent;
  const factory DepartmentsEvent.editDepartment({
    required int id,
    String? name,
  }) = EditDepartmentEvent;
  const factory DepartmentsEvent.deleteDepartments(int id) =
      DeleteDepartmentsEvent;
  const factory DepartmentsEvent.addJob(int departmentId, {String? title}) =
      AddJobEvent;
  const factory DepartmentsEvent.editJob({
    required int jobId,
    required int departmentId,
    String? title,
  }) = EditJobEvent;
  const factory DepartmentsEvent.deleteJob(int id) = DeleteJobEvent;
}

typedef DepartmentsAndJobsEvent = DepartmentsEvent;
