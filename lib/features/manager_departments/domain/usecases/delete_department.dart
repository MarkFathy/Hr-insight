import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class DeleteDepartment {
  final DepartmentsRepository repository;
  DeleteDepartment(this.repository);

  ResultFuture<DepartmentsEntity> call(int id) async =>
      repository.deleteDepartment(id);
}

class DeleteDepartmentUC extends DeleteDepartment {
  DeleteDepartmentUC(super.repository);
}
