import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';

part 'event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.autoLogin() = AutoLoginEvent;
  const factory AuthEvent.employeeSignIn() = EmployeeSignInEvent;
  const factory AuthEvent.managerSignIn() = ManagerSignInEvent;
  const factory AuthEvent.getDepartments() = GetDepartmentsEvent;
  const factory AuthEvent.getJobTitles(int departmentId) = GetJobTitlesEvent;
  const factory AuthEvent.changePassword({required bool isEmployee}) =
      ChangePasswordEvent;
  const factory AuthEvent.managerSignUp() = ManagerSignUpEvent;
  const factory AuthEvent.employeeSignUp() = EmployeeSignUpEvent;
  const factory AuthEvent.signOut() = SignOutEvent;
  const factory AuthEvent.verifyEmail(VerifyParams params) = VerifyEmailEvent;
  const factory AuthEvent.forgetPassword({required bool isEmployee}) =
      ForgetPasswordEvent;
  const factory AuthEvent.resetPassword(ResetPasswordParams params) =
      ResetPasswordEvent;
  const factory AuthEvent.deleteAccount(AccountDeleteParams params) =
      DeleteAccountEvent;
}
