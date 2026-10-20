import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/repositories/repository.dart';

class DeleteDepartmentUC {
  final DepartmentsAndJobsRepo repository;
  DeleteDepartmentUC(this.repository);

  ResultFuture<DepartmentsEntity> call(int id) async => repository.deleteDepartment(id);
}
