import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class GetManagerDepartmentsUC implements UseCase<ManagerInfoEntity?, String> {
  final AuthRepository repository;
  GetManagerDepartmentsUC(this.repository);

  @override
  Future<Either<Failure, ManagerInfoEntity?>> call(String params) async {
    return repository.getDepartments(params);
  }
}
