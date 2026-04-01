import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import '../repositories/repository.dart';

class DeleteJobUC extends UseCase<DepartmentsEntity, int> {
  final DepartmentsAndJobsRepo repository;
  DeleteJobUC(this.repository);
  @override
  Future<Either<Failure, DepartmentsEntity>> call(int params) async {
    return await repository.deleteJob(params);
  }
}
