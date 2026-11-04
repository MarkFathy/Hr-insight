import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager_employees/domain/repositories/employees_repository.dart';

class GetEmployees {
  final EmployeesRepository repository;
  GetEmployees(this.repository);

  ResultFuture<EmployeesEntity> call() async => repository.getEmployees();
}

class GetEmployeesUseCase extends GetEmployees {
  GetEmployeesUseCase(super.repository);
}

typedef GetEmployeesUC = GetEmployeesUseCase;
