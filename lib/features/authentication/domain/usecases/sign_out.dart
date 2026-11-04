import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/core/usecases/usecase.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;
  SignOut(this.repository);

  ResultFuture<String> call(NoParams noParams) async => repository.signOut();
}

typedef SignOutUC = SignOut;
