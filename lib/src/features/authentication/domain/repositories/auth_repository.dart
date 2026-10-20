import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';

abstract class AuthRepository {
  ResultFuture<Map<String, dynamic>?> autoLogin();
  ResultFuture<EmployeeEntity?> employeeSignIn({
    required String email,
    required String password,
  });
  ResultFuture<ManagerEntity?> managerSignIn({
    required String email,
    required String password,
  });
  ResultFuture<ManagerEntity?> managerSignUp(ManagerRegisterParams params);
  ResultFuture<EmployeeEntity?> employeeSignUp(EmployeeRegisterParams params);
  ResultFuture<ManagerInfoEntity?> getDepartments(String params);
  ResultFuture<String> signOut();
  ResultFuture<String> changePassword(ChangePasswordParams params);
  ResultFuture<Map<String, dynamic>?> verifyEmail(VerifyParams params);
  ResultFuture<Map<String, dynamic>?> resetPassword(ResetPasswordParams params);
  ResultFuture<Map<String, dynamic>?> forgetPassword(
    ForgetPasswordParams params,
  );
  ResultFuture<void> deleteAccount(AccountDeleteParams params);
}
