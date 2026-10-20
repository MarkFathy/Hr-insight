import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class ChangePasswordUC {
  final AuthRepository repository;
  ChangePasswordUC(this.repository);

  ResultFuture<String> call(ChangePasswordParams params) async => repository.changePassword(params);
}
