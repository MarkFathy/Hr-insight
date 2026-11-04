import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class ManagerSignUp {
  final AuthRepository repository;
  ManagerSignUp(this.repository);

  ResultFuture<ManagerEntity?> call(ManagerRegisterParams params) async =>
      repository.managerSignUp(params);
}

typedef ManagerSignUpUC = ManagerSignUp;
