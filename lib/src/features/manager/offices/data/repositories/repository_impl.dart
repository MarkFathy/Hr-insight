import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/network/network_info.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import '../../domain/repositories/repository.dart';

class OfficesRepoImpl implements OfficesRepo {
  final OfficesRemoteSrc remoteDataSource;
  final NetworkInfo networkInfo;

  OfficesRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, OfficesEntity>> getOffices() async {
    try {
      final remoteSections = await remoteDataSource.fetchOffices();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OfficesEntity>> addOffice(OfficeParams params) async {
    try {
      final remoteSections = await remoteDataSource.addOffice(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OfficesEntity>> deleteOffice(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteOffice(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OfficesEntity>> editOffice(OfficeParams params) async {
    try {
      final remoteSections = await remoteDataSource.editOffice(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OfficeDetailsEntity>> getOfficeDetails(int id) async {
    try {
      final remoteSections = await remoteDataSource.getOfficeDetails(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> setEmployee(SetEmployeeParams params) async {
    try {
      final remoteSections = await remoteDataSource.setEmployee(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
