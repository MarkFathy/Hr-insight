import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class VerifyEmail {
  final AuthRepository repository;
  VerifyEmail(this.repository);

  ResultFuture<Map<String, dynamic>?> call(VerifyParams params) async =>
      repository.verifyEmail(params);
}

typedef VerifyEmailUC = VerifyEmail;
