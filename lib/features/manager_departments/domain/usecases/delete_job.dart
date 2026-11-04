import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class DeleteJob {
  final DepartmentsRepository repository;
  DeleteJob(this.repository);

  ResultFuture<DepartmentsEntity> call(int id) async =>
      repository.deleteJob(id);
}

class DeleteJobUC extends DeleteJob {
  DeleteJobUC(super.repository);
}
