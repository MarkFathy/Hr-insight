import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class DeleteAccountUseCase {
  final AuthRepository repository;
  DeleteAccountUseCase(this.repository);

  ResultFuture<void> call(AccountDeleteParams params) => repository.deleteAccount(params);
}

/// Backwards compatibility alias
typedef DeleteAccountUC = DeleteAccountUseCase;
