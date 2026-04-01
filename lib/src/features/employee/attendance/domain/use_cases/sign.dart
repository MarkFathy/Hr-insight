import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';
import '../repositories/repository.dart';

class SignUC extends UseCase<SignEntity, bool> {
  final AttendanceRepo repository;
  SignUC(this.repository);
  @override
  Future<Either<Failure, SignEntity>> call(bool params) async {
    return await repository.sign(params);
  }
}
