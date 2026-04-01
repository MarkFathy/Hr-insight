import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';

abstract class DepartmentsAndJobsRepo {
  Future<Either<Failure, DepartmentsEntity>> getDepartments();
  Future<Either<Failure, DepartmentsEntity>> addDepartment(String params);
  Future<Either<Failure, DepartmentsEntity>> editDepartment(
      DepartmentsParams params);
  Future<Either<Failure, DepartmentsEntity>> deleteDepartment(int id);
  Future<Either<Failure, DepartmentsEntity>> addJob(DepartmentsParams params);
  Future<Either<Failure, DepartmentsEntity>> editJob(JobParams params);
  Future<Either<Failure, DepartmentsEntity>> deleteJob(int id);
}
