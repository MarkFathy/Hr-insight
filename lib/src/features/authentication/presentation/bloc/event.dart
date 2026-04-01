part of "bloc.dart";

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AutoLoginEvent extends AuthEvent {}

class EmployeeSignInEvent extends AuthEvent {
  EmployeeSignInEvent();
}

class ManagerSignInEvent extends AuthEvent {
  ManagerSignInEvent();
}

class GetDepartmentsEvent extends AuthEvent {
  GetDepartmentsEvent();
}

class GetJobTitlesEvent extends AuthEvent {
  final int departmentId;

  GetJobTitlesEvent(this.departmentId);
}

class ChangePasswordEvent extends AuthEvent {
  final bool isEmployee;

  ChangePasswordEvent({required this.isEmployee});
}

class ManagerSignUpEvent extends AuthEvent {
  ManagerSignUpEvent();
}

class EmployeeSignUpEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class VerifyEmailEvent extends AuthEvent {
  final VerifyParams params;
  VerifyEmailEvent(this.params);
}

class ForgetPasswordEvent extends AuthEvent {
  final bool isEmployee;
  ForgetPasswordEvent(this.isEmployee);
}

class ResetPasswordEvent extends AuthEvent {
  final ResetPasswordParams params;
  ResetPasswordEvent(this.params);
}

class DeleteAccountEvent extends AuthEvent {
  final AccountDeleteParams params;
  DeleteAccountEvent(this.params);
}
