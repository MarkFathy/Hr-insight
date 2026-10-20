import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/offices/data/data_sources/remote_src.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class OfficesRepoImpl implements OfficesRepo {
  final OfficesRemoteSrc remoteDataSource;

  OfficesRepoImpl({required this.remoteDataSource});

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
