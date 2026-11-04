import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/entities/job_param.dart';

abstract interface class DepartmentsRepository {
  ResultFuture<DepartmentsEntity> getDepartments();
  ResultFuture<DepartmentsEntity> addDepartment(String params);
  ResultFuture<DepartmentsEntity> editDepartment(DepartmentsParams params);
  ResultFuture<DepartmentsEntity> deleteDepartment(int id);
  ResultFuture<DepartmentsEntity> addJob(DepartmentsParams params);
  ResultFuture<DepartmentsEntity> editJob(JobParams params);
  ResultFuture<DepartmentsEntity> deleteJob(int id);
}

typedef DepartmentsAndJobsRepo = DepartmentsRepository;
typedef DepartmentsRepo = DepartmentsRepository;
