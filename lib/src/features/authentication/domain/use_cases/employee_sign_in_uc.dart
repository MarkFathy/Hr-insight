import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class EmployeeSignInUC implements UseCase<EmployeeEntity?, Map> {
  final AuthRepository repository;
  EmployeeSignInUC(this.repository);

  @override
  Future<Either<Failure, EmployeeEntity?>> call(Map params) async {
    return await repository.employeeSignIn(
        email: params['email'], password: params['password']);
  }
}
