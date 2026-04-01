import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/manager/employees/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';
import '../../domain/repositories/repository.dart';

class EmployeesRepoImpl implements EmployeesRepo {
  final EmployeesRemoteSrc remoteDataSource;
  final NetworkInfo networkInfo;

  EmployeesRepoImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, EmployeesEntity>> getEmployees() async {
    try {
      final remoteSections = await remoteDataSource.fetchEmployees();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  // @override
  // Future<Either<Failure, OfficesEntity>> addOffice(OfficeParams params) async {
  //   try {
  //     final remoteSections = await remoteDataSource.addOffice(params);
  //     return Right(remoteSections);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message));
  //   }
  // }

  @override
  Future<Either<Failure, EmployeesEntity>> deleteEmployee(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteEmployee(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  // @override
  // Future<Either<Failure, OfficeDetailsEntity>> getOfficeDetails(int id) async {
  //   try {
  //     final remoteSections = await remoteDataSource.getOfficeDetails(id);
  //     return Right(remoteSections);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message));
  //   }
  // }
}
