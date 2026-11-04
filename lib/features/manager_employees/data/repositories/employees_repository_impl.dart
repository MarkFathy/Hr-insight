import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_employees/data/datasources/employees_remote_data_source.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager_employees/domain/repositories/employees_repository.dart';

class EmployeesRepositoryImpl implements EmployeesRepository {
  final EmployeesRemoteDataSource remoteDataSource;

  EmployeesRepositoryImpl({required this.remoteDataSource});

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

typedef EmployeesRepoImpl = EmployeesRepositoryImpl;
