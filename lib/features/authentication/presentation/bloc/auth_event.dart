import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.autoLogin() = AutoLoginEvent;
  const factory AuthEvent.employeeSignIn({String? email, String? password}) =
      EmployeeSignInEvent;
  const factory AuthEvent.managerSignIn({String? email, String? password}) =
      ManagerSignInEvent;
  const factory AuthEvent.getDepartments({String? managerPin}) =
      GetDepartmentsEvent;
  const factory AuthEvent.getJobTitles(int departmentId) = GetJobTitlesEvent;
  const factory AuthEvent.changePassword({
    required bool isEmployee,
    String? oldPassword,
    String? newPassword,
  }) = ChangePasswordEvent;
  const factory AuthEvent.managerSignUp({ManagerRegisterParams? params}) =
      ManagerSignUpEvent;
  const factory AuthEvent.employeeSignUp({EmployeeRegisterParams? params}) =
      EmployeeSignUpEvent;
  const factory AuthEvent.signOut() = SignOutEvent;
  const factory AuthEvent.verifyEmail(VerifyParams params) = VerifyEmailEvent;
  const factory AuthEvent.forgetPassword({
    required bool isEmployee,
    String? email,
  }) = ForgetPasswordEvent;
  const factory AuthEvent.resetPassword(ResetPasswordParams params) =
      ResetPasswordEvent;
  const factory AuthEvent.deleteAccount(AccountDeleteParams params) =
      DeleteAccountEvent;
}
