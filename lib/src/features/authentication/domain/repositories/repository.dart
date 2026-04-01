import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/entities/survant_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/user_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map?>> autoLogin();
  Future<Either<Failure, EmployeeEntity?>> employeeSignIn(
      {required String email, required String password});
  Future<Either<Failure, ManagerEntity?>> managerSignIn(
      {required String email, required String password});
  Future<Either<Failure, ManagerEntity?>> managerSignUp(
      ManagerRegisterParams params);
  Future<Either<Failure, EmployeeEntity?>> employeeSignUp(
      EmployeeRegisterParams params);
  Future<Either<Failure, ManagerInfoEntity?>> getDepartments(String params);
  // Future<Either<Failure, JobTitlesEntity?>> getJobTitles(int params);
  Future<Either<Failure, String>> signOut();
  Future<Either<Failure, String>> changePassword(ChangePasswordParams params);
  Future<Either<Failure, Map<String, dynamic>?>> verifyEmail(
      VerifyParams params);
  Future<Either<Failure, Map<String, dynamic>?>> resetPassword(
      ResetPasswordParams params);
  Future<Either<Failure, Map<String, dynamic>?>> forgetPassword(
      ForgetPasswordParams params);
  Future<Either<Failure, void>> deleteAccount(AccountDeleteParams params);
}
