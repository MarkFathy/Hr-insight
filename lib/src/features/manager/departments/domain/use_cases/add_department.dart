import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import '../repositories/repository.dart';

class AddDepartmentUC extends UseCase<DepartmentsEntity, String> {
  final DepartmentsAndJobsRepo repository;
  AddDepartmentUC(this.repository);
  @override
  Future<Either<Failure, DepartmentsEntity>> call(String params) async {
    return await repository.addDepartment(params);
  }
}
