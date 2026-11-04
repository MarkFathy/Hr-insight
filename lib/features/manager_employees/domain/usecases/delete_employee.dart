import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager_employees/domain/repositories/employees_repository.dart';

class DeleteEmployee {
  final EmployeesRepository repository;
  DeleteEmployee(this.repository);

  ResultFuture<EmployeesEntity> call(int id) async =>
      repository.deleteEmployee(id);
}

class DeleteEmployeeUseCase extends DeleteEmployee {
  DeleteEmployeeUseCase(super.repository);
}

typedef DeleteEmployeeUC = DeleteEmployeeUseCase;
