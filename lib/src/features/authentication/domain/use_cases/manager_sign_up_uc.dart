import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class ManagerSignUpUC {
  final AuthRepository repository;
  ManagerSignUpUC(this.repository);

  ResultFuture<ManagerEntity?> call(ManagerRegisterParams params) async => repository.managerSignUp(params);
}
