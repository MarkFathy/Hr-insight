import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/employees/domain/entities/employees_entity.dart';
import 'package:hr_app/features/manager/employees/domain/repositories/repository.dart';

class DeleteEmployeeUseCase {
  final EmployeesRepo repository;
  DeleteEmployeeUseCase(this.repository);

  ResultFuture<EmployeesEntity> call(int id) async =>
      repository.deleteEmployee(id);
}

typedef DeleteEmployeeUC = DeleteEmployeeUseCase;
