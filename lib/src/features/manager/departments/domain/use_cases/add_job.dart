import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import '../repositories/repository.dart';

class AddJobUC extends UseCase<DepartmentsEntity, DepartmentsParams> {
  final DepartmentsAndJobsRepo repository;
  AddJobUC(this.repository);
  @override
  Future<Either<Failure, DepartmentsEntity>> call(
      DepartmentsParams params) async {
    return await repository.addJob(params);
  }
}
