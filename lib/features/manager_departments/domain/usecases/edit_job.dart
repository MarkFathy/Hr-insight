import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/job_param.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class EditJob {
  final DepartmentsRepository repository;
  EditJob(this.repository);

  ResultFuture<DepartmentsEntity> call(JobParams params) async =>
      repository.editJob(params);
}

class EditJobUC extends EditJob {
  EditJobUC(super.repository);
}
