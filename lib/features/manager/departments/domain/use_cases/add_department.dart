import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/repositories/repository.dart';

class AddDepartmentUC {
  final DepartmentsAndJobsRepo repository;
  AddDepartmentUC(this.repository);

  ResultFuture<DepartmentsEntity> call(String params) async =>
      repository.addDepartment(params);
}
