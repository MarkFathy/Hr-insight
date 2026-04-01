import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';
import '../repositories/repository.dart';

class GetEmployeesUC extends UseCase<EmployeesEntity, NoParams> {
  final EmployeesRepo repository;
  GetEmployeesUC(this.repository);
  @override
  Future<Either<Failure, EmployeesEntity>> call(NoParams params) async {
    return await repository.getEmployees();
  }
}
