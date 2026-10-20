import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/src/features/manager/employees/domain/repositories/repository.dart';

class GetEmployeesUseCase {
  final EmployeesRepo repository;
  GetEmployeesUseCase(this.repository);

  ResultFuture<EmployeesEntity> call() async => repository.getEmployees();
}

typedef GetEmployeesUC = GetEmployeesUseCase;
