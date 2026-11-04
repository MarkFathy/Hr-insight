import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_employees/domain/entities/employees_entity.dart';

abstract interface class EmployeesRepository {
  ResultFuture<EmployeesEntity> getEmployees();
  ResultFuture<EmployeesEntity> deleteEmployee(int id);
}

typedef EmployeesRepo = EmployeesRepository;
