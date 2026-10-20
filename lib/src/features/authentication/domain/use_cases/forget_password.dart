import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class ForgetPasswordUC {
  final AuthRepository repository;
  ForgetPasswordUC(this.repository);

  ResultFuture<Map<String, dynamic>?> call(ForgetPasswordParams params) async => repository.forgetPassword(params);
}
