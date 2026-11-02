import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager/departments/domain/repositories/repository.dart';

class EditDepartmentUC {
  final DepartmentsAndJobsRepo repository;
  EditDepartmentUC(this.repository);

  ResultFuture<DepartmentsEntity> call(DepartmentsParams params) async =>
      repository.editDepartment(params);
}
