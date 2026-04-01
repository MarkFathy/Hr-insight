import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class SignOutUC implements UseCase<String, NoParams> {
  final AuthRepository repository;
  SignOutUC(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await repository.signOut();
  }
}
