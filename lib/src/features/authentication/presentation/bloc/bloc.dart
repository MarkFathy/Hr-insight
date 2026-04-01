import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/entities/survant_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/user_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/auto_login_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/change_password_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/delete_accoutnt_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/forget_password.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/get_departments_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/employee_sign_in_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/manager_sign_in_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/reset_password.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/sign_out_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/employee_sign_up_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/manager_sign_up_uc.dart';
import 'package:hr_app/src/features/authentication/domain/use_cases/verify_email.dart';
part 'state.dart';
part 'event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AutoLoginUC autoLoginUC;
  final EmployeeSignInUC signInUC;
  final EmployeeSignUpUC employeeSignUpUC;
  final ManagerSignInUC managerSignInUC;
  final ManagerSignUpUC managerSignUpUC;
  final GetManagerDepartmentsUC getDepartmentsUC;
  final ChangePasswordUC changePasswordUC;
  final VerifyEmailUC verifyEmailUC;
  final SignOutUC signOutUC;
  final ForgetPasswordUC forgetPasswordUC;
  final ResetPasswordUC resetPasswordUC;
  final DeleteAccountUC deleteAccountUC;

  AuthBloc({
    required this.autoLoginUC,
    required this.signInUC,
    required this.signOutUC,
    required this.employeeSignUpUC,
    required this.managerSignUpUC,
    required this.getDepartmentsUC,
    required this.changePasswordUC,
    required this.managerSignInUC,
    required this.verifyEmailUC,
    required this.forgetPasswordUC,
    required this.resetPasswordUC,
    required this.deleteAccountUC,
  }) : super(AuthInitial()) {
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

  ///

  FutureOr<void> _employeeSignIn(
      EmployeeSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await signInUC.call({
        "email": emailCtrl.text,
        "password": passwordCtrl.text,
      });
      userRequest.fold((l) {
        if (l.message.contains(AppConsts.kVerifyEmail)) {
          emit(ActivateAccountState(emailCtrl.text));
        }
        return emit(AuthFailureState(l.message));
      }, (r) {
        employee = r!;
        emit(AuthSuccessState(employee: r));
      });
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _employeeSignUp(
      EmployeeSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await employeeSignUpUC.call(EmployeeRegisterParams(
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
      ));

      emit(userRequest.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        employee = r;
        return EmailVerifiedState(employee: r);
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _managerSignIn(
      ManagerSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await managerSignInUC.call({
        "email": emailCtrl.text,
        "password": passwordCtrl.text,
      });
      emit(userRequest.fold((l) {
        if (l.message.contains(AppConsts.kVerifyEmail)) {
          return ActivateAccountState(emailCtrl.text);
        }
        return AuthFailureState(l.message);
      }, (r) {
        manager = r!;
        return AuthSuccessState(manager: r);
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _managerSignUp(
      ManagerSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    // while (_locationData == null) {
    //   await getLocation();
    // }
    try {
      final userRequest = await managerSignUpUC.call(ManagerRegisterParams(
        name: nameCtrl.text,
        email: emailCtrl.text,
        password: passwordCtrl.text,
        passwordConfirmation: confirmPasswordCtrl.text,
        companyName: companyCtrl.text,
        phone: phoneCtrl.text,
        image: profileImage!,
      ));

      emit(userRequest.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        manager = r;
        return EmailVerifiedState(manager: r!);
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final admin = await signOutUC.call(NoParams());

      emit(admin.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        return AuthInitial();
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _autoLogin(
      AutoLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final userRequest = await autoLoginUC.call(NoParams());
      emit(userRequest.fold((l) => AuthInitial(), (r) {
        if (r!['isEmployee']) {
          employee = EmployeeEntity.fromMap(r['data']);
          return AuthSuccessState(employee: employee);
        } else {
          manager = ManagerEntity.fromJson(r['data']);
          return AuthSuccessState(manager: manager);
        }
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _getDepartments(
      GetDepartmentsEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final user = await getDepartmentsUC.call(managerPin.text);

      emit(user.fold((l) {
        print("Error: ${l.message}");
        return AuthFailureState(l.message);
      }, (r) {
        info = r;
        return ValidUIDState();
      }));
    } on Exception catch (e) {
      print("Exception: $e"); // Log the exception
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _changePassword(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    if (employee == null) emit(AuthFailureState('قم بتسجيل الدخول اولا'));

    emit(AuthLoadingState());

    try {
      final user = await changePasswordUC.call(ChangePasswordParams(
          oldPassword: oldPassword.text,
          password: passwordCtrl.text,
          passwordConfirmation: confirmPasswordCtrl.text,
          isEmployee: event.isEmployee,
          token: employee!.data!.token));

      emit(user.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        return PasswordChangedState(r!);
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _verifyEmail(
      VerifyEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await verifyEmailUC.call(event.params);
      emit(userRequest.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        if (event.params.isEmployee) {
          employee = EmployeeEntity.fromMap(r!);
          return AuthSuccessState(employee: employee);
        } else {
          manager = ManagerEntity.fromJson(r!);
          return AuthSuccessState(manager: manager);
        }
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _forgetPassword(
      ForgetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await forgetPasswordUC.call(ForgetPasswordParams(
          email: emailCtrl.text, isEmployee: event.isEmployee));
      emit(userRequest.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        return ForgetPasswordState();
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  FutureOr<void> _resetPassword(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final userRequest = await resetPasswordUC.call(event.params);
      emit(userRequest.fold((l) {
        return AuthFailureState(l.message);
      }, (r) {
        return PasswordResettedState(r!['message']);
      }));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  Future<void> _deleteAccount(
      DeleteAccountEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final userRequest = await deleteAccountUC.call(event.params);

      emit(userRequest.fold(
        (failure) => AuthFailureState(failure.message),
        (_) => AuthInitial(),
      ));
    } on Exception catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
