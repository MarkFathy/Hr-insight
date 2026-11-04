import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoadingState;
  const factory AuthState.validUID() = ValidUIDState;
  const factory AuthState.departmentSelected() = DepartmentSelectedState;
  const factory AuthState.passwordChanged(String message) =
      PasswordChangedState;
  const factory AuthState.forgetPassword() = ForgetPasswordState;
  const factory AuthState.passwordResetted(String message) =
      PasswordResettedState;
  const factory AuthState.activateAccount(String email) = ActivateAccountState;
  const factory AuthState.emailVerified({
    ManagerEntity? manager,
    EmployeeEntity? employee,
  }) = EmailVerifiedState;
  const factory AuthState.success({
    EmployeeEntity? employee,
    ManagerEntity? manager,
  }) = AuthSuccessState;
  const factory AuthState.failure(String error) = AuthFailureState;
  const factory AuthState.accountDeleted(String message) = AccountDeletedState;

  bool get isEmployee => switch (this) {
    AuthSuccessState(:final employee, :final manager) =>
      employee != null && manager == null,
    _ => false,
  };
}
