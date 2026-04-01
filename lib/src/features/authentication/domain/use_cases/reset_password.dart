import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class ResetPasswordUC
    implements UseCase<Map<String, dynamic>?, ResetPasswordParams> {
  final AuthRepository repository;
  ResetPasswordUC(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(
      ResetPasswordParams params) async {
    return await repository.resetPassword(params);
  }
}
