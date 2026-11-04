import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/constants/app_constants.dart';
import 'package:hr_app/core/usecases/usecase.dart';
import 'package:hr_app/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/features/authentication/domain/usecases/auto_login.dart';
import 'package:hr_app/features/authentication/domain/usecases/change_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/delete_account.dart';
import 'package:hr_app/features/authentication/domain/usecases/employee_sign_in.dart';
import 'package:hr_app/features/authentication/domain/usecases/employee_sign_up.dart';
import 'package:hr_app/features/authentication/domain/usecases/forget_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/get_manager_departments.dart';
import 'package:hr_app/features/authentication/domain/usecases/manager_sign_in.dart';
import 'package:hr_app/features/authentication/domain/usecases/manager_sign_up.dart';
import 'package:hr_app/features/authentication/domain/usecases/reset_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/sign_out.dart';
import 'package:hr_app/features/authentication/domain/usecases/verify_email.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_event.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AutoLogin autoLogin;
  final EmployeeSignIn employeeSignIn;
  final EmployeeSignUp employeeSignUp;
  final ManagerSignIn managerSignIn;
  final ManagerSignUp managerSignUp;
  final GetManagerDepartments getDepartments;
  final ChangePassword changePassword;
  final VerifyEmail verifyEmail;
  final SignOut signOut;
  final ForgetPassword forgetPassword;
  final ResetPassword resetPassword;
  final DeleteAccount deleteAccount;

  // Legacy field getters for backwards compatibility
  AutoLogin get autoLoginUC => autoLogin;
  EmployeeSignIn get signInUC => employeeSignIn;
  EmployeeSignUp get employeeSignUpUC => employeeSignUp;
  ManagerSignIn get managerSignInUC => managerSignIn;
  ManagerSignUp get managerSignUpUC => managerSignUp;
  GetManagerDepartments get getDepartmentsUC => getDepartments;
  ChangePassword get changePasswordUC => changePassword;
  VerifyEmail get verifyEmailUC => verifyEmail;
  SignOut get signOutUC => signOut;
  ForgetPassword get forgetPasswordUC => forgetPassword;
  ResetPassword get resetPasswordUC => resetPassword;
  DeleteAccount get deleteAccountUC => deleteAccount;

  AuthBloc({
    AutoLogin? autoLogin,
    AutoLogin? autoLoginUC,
    EmployeeSignIn? employeeSignIn,
    EmployeeSignIn? signInUC,
    SignOut? signOut,
    SignOut? signOutUC,
    EmployeeSignUp? employeeSignUp,
    EmployeeSignUp? employeeSignUpUC,
    ManagerSignUp? managerSignUp,
    ManagerSignUp? managerSignUpUC,
    GetManagerDepartments? getDepartments,
    GetManagerDepartments? getDepartmentsUC,
    ChangePassword? changePassword,
    ChangePassword? changePasswordUC,
    ManagerSignIn? managerSignIn,
    ManagerSignIn? managerSignInUC,
    VerifyEmail? verifyEmail,
    VerifyEmail? verifyEmailUC,
    ForgetPassword? forgetPassword,
    ForgetPassword? forgetPasswordUC,
    ResetPassword? resetPassword,
    ResetPassword? resetPasswordUC,
    DeleteAccount? deleteAccount,
    DeleteAccount? deleteAccountUC,
  }) : autoLogin = autoLogin ?? autoLoginUC!,
       employeeSignIn = employeeSignIn ?? signInUC!,
       signOut = signOut ?? signOutUC!,
       employeeSignUp = employeeSignUp ?? employeeSignUpUC!,
       managerSignUp = managerSignUp ?? managerSignUpUC!,
       getDepartments = getDepartments ?? getDepartmentsUC!,
       changePassword = changePassword ?? changePasswordUC!,
       managerSignIn = managerSignIn ?? managerSignInUC!,
       verifyEmail = verifyEmail ?? verifyEmailUC!,
       forgetPassword = forgetPassword ?? forgetPasswordUC!,
       resetPassword = resetPassword ?? resetPasswordUC!,
       deleteAccount = deleteAccount ?? deleteAccountUC!,
       super(const AuthState.initial()) {
    on<AutoLoginEvent>(_autoLogin);
    on<EmployeeSignInEvent>(_employeeSignIn);
    on<EmployeeSignUpEvent>(_employeeSignUp);
    on<ManagerSignInEvent>(_managerSignIn);
    on<ManagerSignUpEvent>(_managerSignUp);
    on<SignOutEvent>(_signOut);
    on<GetDepartmentsEvent>(_getDepartments);
    on<ChangePasswordEvent>(_changePassword);
    on<VerifyEmailEvent>(_verifyEmail);
    on<ForgetPasswordEvent>(_forgetPassword);
    on<ResetPasswordEvent>(_resetPassword);
    on<DeleteAccountEvent>(_deleteAccount);
  }

  //Controllers
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController companyCtrl = TextEditingController();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController nationalityNumCtrl = TextEditingController();
  final TextEditingController careerCtrl = TextEditingController();
  final TextEditingController careerDescriptionCtrl = TextEditingController();
  final TextEditingController managerPin = TextEditingController();
  final TextEditingController verificationCode = TextEditingController();
  //Vars
  int? departId;
  int? jobId;
  int? officeId;

  File? profileImage;
  File? faceImage;
  File? backImage;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ManagerInfoEntity? info;
  ManagerEntity? manager;
  EmployeeEntity? employee;
  //Getters
  bool get isEmployee => employee != null && manager == null;
  bool get validateImages => faceImage != null && backImage != null;

  FutureOr<void> _employeeSignIn(
    EmployeeSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final email = event.email ?? emailCtrl.text;
      final password = event.password ?? passwordCtrl.text;
      final userRequest = await employeeSignIn.call({
        'email': email,
        'password': password,
      });
      userRequest.fold(
        (l) {
          if (l.message.contains(AppConstants.kVerifyEmail)) {
            emit(AuthState.activateAccount(email));
          }
          return emit(AuthState.failure(l.message));
        },
        (r) {
          employee = r;
          emit(AuthState.success(employee: r));
        },
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _employeeSignUp(
    EmployeeSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final params =
          event.params ??
          EmployeeRegisterParams(
            name: nameCtrl.text,
            email: emailCtrl.text,
            password: passwordCtrl.text,
            phone: phoneCtrl.text,
            confirmPassword: confirmPasswordCtrl.text,
            address: addressCtrl.text,
            image: profileImage!,
            managerPin: managerPin.text,
            jobId: jobId!,
            departmentId: departId!,
            officeId: officeId!,
          );
      final userRequest = await employeeSignUp.call(params);

      emit(
        userRequest.fold((l) => AuthState.failure(l.message), (r) {
          employee = r;
          return AuthState.emailVerified(employee: r);
        }),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _managerSignIn(
    ManagerSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final email = event.email ?? emailCtrl.text;
      final password = event.password ?? passwordCtrl.text;
      final userRequest = await managerSignIn.call({
        'email': email,
        'password': password,
      });
      emit(
        userRequest.fold(
          (l) {
            if (l.message.contains(AppConstants.kVerifyEmail)) {
              return AuthState.activateAccount(email);
            }
            return AuthState.failure(l.message);
          },
          (r) {
            manager = r;
            return AuthState.success(manager: r);
          },
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _managerSignUp(
    ManagerSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final params =
          event.params ??
          ManagerRegisterParams(
            name: nameCtrl.text,
            email: emailCtrl.text,
            password: passwordCtrl.text,
            passwordConfirmation: confirmPasswordCtrl.text,
            companyName: companyCtrl.text,
            phone: phoneCtrl.text,
            image: profileImage!,
          );
      final userRequest = await managerSignUp.call(params);

      emit(
        userRequest.fold((l) => AuthState.failure(l.message), (r) {
          manager = r;
          return AuthState.emailVerified(manager: r);
        }),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final admin = await signOut.call(const NoParams());

      emit(
        admin.fold(
          (l) => AuthState.failure(l.message),
          (r) => const AuthState.initial(),
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _autoLogin(
    AutoLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final userRequest = await autoLogin.call(const NoParams());
      emit(
        userRequest.fold((l) => const AuthState.initial(), (r) {
          if (r == null) {
            return const AuthState.initial();
          }
          final isEmployee = r['isEmployee'] == true;
          final rawData = r['data'];
          if (rawData is! Map<String, dynamic>) {
            return const AuthState.initial();
          }
          if (isEmployee) {
            employee = EmployeeEntity.fromMap(rawData);
            return AuthState.success(employee: employee);
          } else {
            manager = ManagerEntity.fromJson(rawData);
            return AuthState.success(manager: manager);
          }
        }),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _getDepartments(
    GetDepartmentsEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final pin = event.managerPin ?? managerPin.text;
      final user = await getDepartments.call(pin);

      emit(
        user.fold(
          (l) {
            debugPrint('Error: ${l.message}');
            return AuthState.failure(l.message);
          },
          (r) {
            info = r;
            return const AuthState.validUID();
          },
        ),
      );
    } on Exception catch (e) {
      debugPrint('Exception: $e');
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _changePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (employee == null) {
      emit(const AuthState.failure('قم بتسجيل الدخول اولا'));
      return;
    }

    emit(const AuthState.loading());

    try {
      final oldPass = event.oldPassword ?? oldPassword.text;
      final newPass = event.newPassword ?? passwordCtrl.text;
      final user = await changePassword.call(
        ChangePasswordParams(
          oldPassword: oldPass,
          password: newPass,
          passwordConfirmation: confirmPasswordCtrl.text,
          isEmployee: event.isEmployee,
          token: employee!.data!.token,
        ),
      );

      emit(
        user.fold(
          (l) => AuthState.failure(l.message),
          AuthState.passwordChanged,
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _verifyEmail(
    VerifyEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final userRequest = await verifyEmail.call(event.params);
      emit(
        userRequest.fold((l) => AuthState.failure(l.message), (r) {
          if (event.params.isEmployee) {
            employee = EmployeeEntity.fromMap(r!);
            return AuthState.success(employee: employee);
          } else {
            manager = ManagerEntity.fromJson(r!);
            return AuthState.success(manager: manager);
          }
        }),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _forgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final email = event.email ?? emailCtrl.text;
      final userRequest = await forgetPassword.call(
        ForgetPasswordParams(email: email, isEmployee: event.isEmployee),
      );
      emit(
        userRequest.fold(
          (l) => AuthState.failure(l.message),
          (r) => const AuthState.forgetPassword(),
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final userRequest = await resetPassword.call(event.params);
      emit(
        userRequest.fold(
          (l) => AuthState.failure(l.message),
          (r) => AuthState.passwordResetted((r?['message'] as String?) ?? ''),
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> _deleteAccount(
    DeleteAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final userRequest = await deleteAccount.call(event.params);

      emit(
        userRequest.fold(
          (failure) => AuthState.failure(failure.message),
          (_) => const AuthState.accountDeleted('تم حذف الحساب بنجاح'),
        ),
      );
    } on Exception catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailCtrl.dispose();
    companyCtrl.dispose();
    oldPassword.dispose();
    passwordCtrl.dispose();
    nameCtrl.dispose();
    confirmPasswordCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    nationalityNumCtrl.dispose();
    careerCtrl.dispose();
    careerDescriptionCtrl.dispose();
    managerPin.dispose();
    verificationCode.dispose();
    return super.close();
  }
}
