import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';

class EmployeeSignIn {
  final AuthRepository repository;
  EmployeeSignIn(this.repository);

  ResultFuture<EmployeeEntity?> call(Map<String, dynamic> params) async =>
      repository.employeeSignIn(
        email: params['email'] as String,
        password: params['password'] as String,
      );
}

typedef EmployeeSignInUC = EmployeeSignIn;
