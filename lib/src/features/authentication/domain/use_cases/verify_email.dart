import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class VerifyEmailUC implements UseCase<Map<String, dynamic>?, VerifyParams> {
  final AuthRepository repository;
  VerifyEmailUC(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(
      VerifyParams params) async {
    return await repository.verifyEmail(params);
  }
}
