import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class DeleteAccountUC implements UseCase<void, AccountDeleteParams> {
  final AuthRepository repository;
  DeleteAccountUC(this.repository);

  @override
  Future<Either<Failure, void>> call(AccountDeleteParams params) {
    return repository.deleteAccount(params);
  }
}
