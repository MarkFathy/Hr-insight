import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class ChangePasswordUC implements UseCase<String?, ChangePasswordParams> {
  final AuthRepository repository;
  ChangePasswordUC(this.repository);

  @override
  Future<Either<Failure, String?>> call(ChangePasswordParams params) async {
    return await repository.changePassword(params);
  }
}
