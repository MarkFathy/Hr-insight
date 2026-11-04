import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class ManagerSignIn {
  final AuthRepository repository;
  ManagerSignIn(this.repository);

  ResultFuture<ManagerEntity?> call(Map<String, dynamic> params) async =>
      repository.managerSignIn(
        email: params['email'] as String,
        password: params['password'] as String,
      );
}

typedef ManagerSignInUC = ManagerSignIn;
