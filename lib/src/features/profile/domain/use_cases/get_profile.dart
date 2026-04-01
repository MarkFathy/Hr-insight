import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import '../repositories/repository.dart';

class GetProfileUC extends UseCase<String, bool> {
  final ProfileRepo repository;
  GetProfileUC(this.repository);
  @override
  Future<Either<Failure, String>> call(bool params) async {
    return await repository.getProfile(params);
  }
}
