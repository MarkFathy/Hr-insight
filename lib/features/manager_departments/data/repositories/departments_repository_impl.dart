import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/data/datasources/departments_remote_data_source.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/entities/job_param.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class DepartmentsRepositoryImpl implements DepartmentsRepository {
  final DepartmentsRemoteDataSource remoteDataSource;

  DepartmentsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<DepartmentsEntity> getDepartments() async {
    try {
      final remoteSections = await remoteDataSource.fetchDepartments();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> addDepartment(String params) async {
    try {
      final remoteSections = await remoteDataSource.addDepartment(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> editDepartment(
    DepartmentsParams params,
  ) async {
    try {
      final remoteSections = await remoteDataSource.editDepartment(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> deleteDepartment(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteDepartment(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> addJob(DepartmentsParams params) async {
    try {
      final remoteSections = await remoteDataSource.addJob(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> editJob(JobParams params) async {
    try {
      final remoteSections = await remoteDataSource.editJob(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<DepartmentsEntity> deleteJob(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteJob(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}

typedef DepartmentsAndJobsRepoImpl = DepartmentsRepositoryImpl;
typedef DepartmentsRepoImpl = DepartmentsRepositoryImpl;
