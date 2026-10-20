import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';

abstract interface class EmployeesRepo {
  ResultFuture<EmployeesEntity> getEmployees();
  ResultFuture<EmployeesEntity> deleteEmployee(int id);
}
