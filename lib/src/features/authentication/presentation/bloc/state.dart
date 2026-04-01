part of "bloc.dart";

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class ValidUIDState extends AuthState {
  ValidUIDState();
}

class DepartmentSelectedState extends AuthState {
  DepartmentSelectedState();
}

class PasswordChangedState extends AuthState {
  final String message;

  PasswordChangedState(this.message);
}

class ForgetPasswordState extends AuthState {
  ForgetPasswordState();
}

class PasswordResettedState extends AuthState {
  final String message;

  PasswordResettedState(this.message);
}

class ActivateAccountState extends AuthState {
  final String email;

  ActivateAccountState(this.email);
}

class EmailVerifiedState extends AuthState {
  final ManagerEntity? manager;
  final EmployeeEntity? employee;
  EmailVerifiedState({this.manager, this.employee});
}

class AuthSuccessState extends AuthState {
  final EmployeeEntity? employee;
  final ManagerEntity? manager;

  AuthSuccessState({this.employee, this.manager});
  bool get isEmployee => (employee != null) && (manager == null);
}

class AuthFailureState extends AuthState {
  final String error;

  AuthFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class AccountDeletedState extends AuthState {
  final String message;

  AccountDeletedState(this.message);

  @override
  List<Object> get props => [message];
}
