import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class ResetPasswordUC {
  final AuthRepository repository;
  ResetPasswordUC(this.repository);

  ResultFuture<Map<String, dynamic>?> call(ResetPasswordParams params) async => repository.resetPassword(params);
}
