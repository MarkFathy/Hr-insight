import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class DeleteAccount {
  final AuthRepository repository;
  DeleteAccount(this.repository);

  ResultFuture<void> call(AccountDeleteParams params) =>
      repository.deleteAccount(params);
}

typedef DeleteAccountUseCase = DeleteAccount;
typedef DeleteAccountUC = DeleteAccount;
