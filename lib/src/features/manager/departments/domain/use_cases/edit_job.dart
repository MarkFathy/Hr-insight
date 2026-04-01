import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';
import '../repositories/repository.dart';

class EditJobUC extends UseCase<DepartmentsEntity, JobParams> {
  final DepartmentsAndJobsRepo repository;
  EditJobUC(this.repository);
  @override
  Future<Either<Failure, DepartmentsEntity>> call(JobParams params) async {
    return await repository.editJob(params);
  }
}
