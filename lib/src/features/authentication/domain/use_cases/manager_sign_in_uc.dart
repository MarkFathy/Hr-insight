import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class ManagerSignInUC {
  final AuthRepository repository;
  ManagerSignInUC(this.repository);

  ResultFuture<ManagerEntity?> call(Map<String, dynamic> params) async =>
      repository.managerSignIn(
        email: params['email'] as String,
        password: params['password'] as String,
      );
}
