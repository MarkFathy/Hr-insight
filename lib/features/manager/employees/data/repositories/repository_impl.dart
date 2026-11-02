import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/errors/app_failure.dart';
import 'package:hr_app/core/errors/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/employees/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager/employees/domain/repositories/repository.dart';

class EmployeesRepoImpl implements EmployeesRepo {
  final EmployeesRemoteSrc remoteDataSource;

  EmployeesRepoImpl({required this.remoteDataSource});

  @override
  ResultFuture<EmployeesEntity> getEmployees() async {
    try {
      final remoteSections = await remoteDataSource.fetchEmployees();
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }

  @override
  ResultFuture<EmployeesEntity> deleteEmployee(int id) async {
    try {
      final remoteSections = await remoteDataSource.deleteEmployee(id);
      return Right(remoteSections);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.unexpected(message: e.toString()));
    }
  }
}
