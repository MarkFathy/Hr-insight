import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/src/features/manager/departments/domain/repositories/repository.dart';

class AddJobUC {
  final DepartmentsAndJobsRepo repository;
  AddJobUC(this.repository);

  ResultFuture<DepartmentsEntity> call(DepartmentsParams params) async => repository.addJob(params);
}
