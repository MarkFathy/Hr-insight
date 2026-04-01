import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class AutoLoginUC implements UseCase<Map?, NoParams> {
  final AuthRepository repository;
  AutoLoginUC(this.repository);

  @override
  Future<Either<Failure, Map?>> call(NoParams noParams) async {
    return await repository.autoLogin();
  }
}
