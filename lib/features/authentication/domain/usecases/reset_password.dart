import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository repository;
  ResetPassword(this.repository);

  ResultFuture<Map<String, dynamic>?> call(ResetPasswordParams params) async =>
      repository.resetPassword(params);
}

typedef ResetPasswordUC = ResetPassword;
