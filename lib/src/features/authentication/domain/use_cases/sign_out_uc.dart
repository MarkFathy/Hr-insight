import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUC {
  final AuthRepository repository;
  SignOutUC(this.repository);

  ResultFuture<String> call(NoParams noParams) async => repository.signOut();
}
