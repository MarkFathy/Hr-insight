import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/repositories/repository.dart';

class GetDepartmentsAndJobsUseCase {
  final DepartmentsAndJobsRepo repository;
  GetDepartmentsAndJobsUseCase(this.repository);

  ResultFuture<DepartmentsEntity> call() async => repository.getDepartments();
}

typedef GetDepartmentAndJobssUC = GetDepartmentsAndJobsUseCase;
