import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class ForgetPassword {
  final AuthRepository repository;
  ForgetPassword(this.repository);

  ResultFuture<Map<String, dynamic>?> call(ForgetPasswordParams params) async =>
      repository.forgetPassword(params);
}

typedef ForgetPasswordUC = ForgetPassword;
