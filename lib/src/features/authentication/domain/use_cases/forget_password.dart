import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class ForgetPasswordUC
    implements UseCase<Map<String, dynamic>?, ForgetPasswordParams> {
  final AuthRepository repository;
  ForgetPasswordUC(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(
      ForgetPasswordParams params) async {
    return await repository.forgetPassword(params);
  }
}
