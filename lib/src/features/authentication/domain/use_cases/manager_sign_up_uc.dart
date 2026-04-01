import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/user_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class ManagerSignUpUC
    implements UseCase<ManagerEntity?, ManagerRegisterParams> {
  final AuthRepository repository;
  ManagerSignUpUC(this.repository);

  @override
  Future<Either<Failure, ManagerEntity?>> call(
      ManagerRegisterParams params) async {
    return await repository.managerSignUp(params);
  }
}
