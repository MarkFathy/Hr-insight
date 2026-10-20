import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';
import 'package:hr_app/src/features/manager/departments/domain/repositories/repository.dart';

class EditJobUC {
  final DepartmentsAndJobsRepo repository;
  EditJobUC(this.repository);

  ResultFuture<DepartmentsEntity> call(JobParams params) async => repository.editJob(params);
}
