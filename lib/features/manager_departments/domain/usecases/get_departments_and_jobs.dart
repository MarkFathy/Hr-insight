import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';

class GetDepartmentsAndJobs {
  final DepartmentsRepository repository;
  GetDepartmentsAndJobs(this.repository);

  ResultFuture<DepartmentsEntity> call() async => repository.getDepartments();
}

class GetDepartmentsAndJobsUseCase extends GetDepartmentsAndJobs {
  GetDepartmentsAndJobsUseCase(super.repository);
}

typedef GetDepartmentAndJobssUC = GetDepartmentsAndJobsUseCase;
