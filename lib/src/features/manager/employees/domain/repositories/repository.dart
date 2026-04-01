import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';

abstract class EmployeesRepo {
  Future<Either<Failure, EmployeesEntity>> getEmployees();
  Future<Either<Failure, EmployeesEntity>> deleteEmployee(int id);
}
