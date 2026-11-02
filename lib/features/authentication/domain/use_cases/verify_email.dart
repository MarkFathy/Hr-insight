import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class VerifyEmailUC {
  final AuthRepository repository;
  VerifyEmailUC(this.repository);

  ResultFuture<Map<String, dynamic>?> call(VerifyParams params) async =>
      repository.verifyEmail(params);
}
