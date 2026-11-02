import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class EmployeeSignUpUC {
  final AuthRepository repository;
  EmployeeSignUpUC(this.repository);

  ResultFuture<EmployeeEntity?> call(EmployeeRegisterParams params) async =>
      repository.employeeSignUp(params);
}
