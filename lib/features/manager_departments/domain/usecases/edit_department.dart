import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class EditDepartment {
  final DepartmentsRepository repository;
  EditDepartment(this.repository);

  ResultFuture<DepartmentsEntity> call(DepartmentsParams params) async =>
      repository.editDepartment(params);
}

class EditDepartmentUC extends EditDepartment {
  EditDepartmentUC(super.repository);
}
