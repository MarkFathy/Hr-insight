import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager/departments/domain/entities/job_param.dart';

abstract interface class DepartmentsAndJobsRepo {
  ResultFuture<DepartmentsEntity> getDepartments();
  ResultFuture<DepartmentsEntity> addDepartment(String params);
  ResultFuture<DepartmentsEntity> editDepartment(DepartmentsParams params);
  ResultFuture<DepartmentsEntity> deleteDepartment(int id);
  ResultFuture<DepartmentsEntity> addJob(DepartmentsParams params);
  ResultFuture<DepartmentsEntity> editJob(JobParams params);
  ResultFuture<DepartmentsEntity> deleteJob(int id);
}
