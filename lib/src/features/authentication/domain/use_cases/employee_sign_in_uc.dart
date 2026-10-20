import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class EmployeeSignInUC {
  final AuthRepository repository;
  EmployeeSignInUC(this.repository);

  ResultFuture<EmployeeEntity?> call(Map<String, dynamic> params) async =>
      repository.employeeSignIn(
        email: params['email'] as String,
        password: params['password'] as String,
      );
}
