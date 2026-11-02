import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class ChangePasswordUC {
  final AuthRepository repository;
  ChangePasswordUC(this.repository);

  ResultFuture<String> call(ChangePasswordParams params) async =>
      repository.changePassword(params);
}
