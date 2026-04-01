import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/manager/departments/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';
import '../../domain/repositories/repository.dart';

class DepartmentsAndJobsRepoImpl implements DepartmentsAndJobsRepo {
  final DepartmentsAndJobRemoteSrc remoteDataSource;
  final NetworkInfo networkInfo;

  DepartmentsAndJobsRepoImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, DepartmentsEntity>> getDepartments() async {
    try {
      final remoteSections = await remoteDataSource.fetchDepartments();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> addDepartment(
      String params) async {
    try {
      final remoteSections = await remoteDataSource.addDepartment(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> deleteDepartment(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteDepartment(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> editDepartment(
      DepartmentsParams params) async {
    try {
      final remoteSections = await remoteDataSource.editDepartment(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> addJob(
      DepartmentsParams params) async {
    try {
      final remoteSections = await remoteDataSource.addJob(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> deleteJob(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteJob(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DepartmentsEntity>> editJob(JobParams params) async {
    try {
      final remoteSections = await remoteDataSource.editJob(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
