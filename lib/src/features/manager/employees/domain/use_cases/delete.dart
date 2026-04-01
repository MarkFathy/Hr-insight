import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';
import '../repositories/repository.dart';

class DeleteEmployeeUC extends UseCase<EmployeesEntity, int> {
  final EmployeesRepo repository;
  DeleteEmployeeUC(this.repository);
  @override
  Future<Either<Failure, EmployeesEntity>> call(int params) async {
    return await repository.deleteEmployee(params);
  }
}
