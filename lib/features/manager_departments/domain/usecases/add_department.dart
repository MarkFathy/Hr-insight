import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class AddDepartment {
  final DepartmentsRepository repository;
  AddDepartment(this.repository);

  ResultFuture<DepartmentsEntity> call(String params) async =>
      repository.addDepartment(params);
}

class AddDepartmentUC extends AddDepartment {
  AddDepartmentUC(super.repository);
}
