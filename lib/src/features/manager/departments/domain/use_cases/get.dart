import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import '../repositories/repository.dart';

class GetDepartmentAndJobssUC extends UseCase<DepartmentsEntity, NoParams> {
  final DepartmentsAndJobsRepo repository;
  GetDepartmentAndJobssUC(this.repository);
  @override
  Future<Either<Failure, DepartmentsEntity>> call(NoParams params) async {
    return await repository.getDepartments();
  }
}
