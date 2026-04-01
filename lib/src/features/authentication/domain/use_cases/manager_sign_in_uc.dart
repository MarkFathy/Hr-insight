import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class ManagerSignInUC implements UseCase<ManagerEntity?, Map> {
  final AuthRepository repository;
  ManagerSignInUC(this.repository);

  @override
  Future<Either<Failure, ManagerEntity?>> call(Map params) async {
    return await repository.managerSignIn(
        email: params['email'], password: params['password']);
  }
}
