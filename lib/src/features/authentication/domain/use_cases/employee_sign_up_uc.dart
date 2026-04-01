import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/survant_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class EmployeeSignUpUC
    implements UseCase<EmployeeEntity?, EmployeeRegisterParams> {
  final AuthRepository repository;
  EmployeeSignUpUC(this.repository);

  @override
  Future<Either<Failure, EmployeeEntity?>> call(
      EmployeeRegisterParams params) async {
    return await repository.employeeSignUp(params);
  }
}
