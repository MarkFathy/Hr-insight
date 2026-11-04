import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/data/datasources/offices_remote_data_source.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_details.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class OfficesRepositoryImpl implements OfficesRepository {
  final OfficesRemoteDataSource remoteDataSource;

  OfficesRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<OfficesEntity> getOffices() async {
    try {
      final remoteSections = await remoteDataSource.fetchOffices();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<OfficesEntity> addOffice(OfficeParams params) async {
    try {
      final remoteSections = await remoteDataSource.addOffice(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<OfficesEntity> deleteOffice(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteOffice(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<OfficesEntity> editOffice(OfficeParams params) async {
    try {
      final remoteSections = await remoteDataSource.editOffice(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<OfficeDetailsEntity> getOfficeDetails(int id) async {
    try {
      final remoteSections = await remoteDataSource.getOfficeDetails(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> setEmployee(SetEmployeeParams params) async {
    try {
      final remoteSections = await remoteDataSource.setEmployee(params);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}

typedef OfficesRepoImpl = OfficesRepositoryImpl;
