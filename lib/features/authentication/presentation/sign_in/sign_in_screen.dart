import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/features/authentication/presentation/employee_sign_up/employee_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/manager_sign_up/manager_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/reset_password/reset_password_dialog.dart';
import 'package:hr_app/routing_screen.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with AutoConnectivityRestoreMixin {
  late final AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AuthBloc>();
  }

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmployee = ModalRoute.of(context)!.settings.arguments! as bool;

    return Scaffold(
      body: BlocProvider.value(
        value: _bloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState || state is EmailVerifiedState) {
              NavigationHelper.nextScreenCloseOthersNamed(
                context,
                RoutingScreen.routeName,
              );
            }
          },
          child: Builder(
            builder: (context) {
              final bloc = context.read<AuthBloc>();

              return SafeArea(
                child: Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: AppBackButton(),
                        ),
                        12.ph,
                        // Header info
                        Text(
                          'تسجيل الدخول',
                          style: context.typography.h2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        6.ph,
                        Text(
                          isEmployee
                              ? 'أهلاً بك مجدداً في بوابة الموظف'
                              : 'أهلاً بك في لوحة تحكم المسؤول',
                          style: context.typography.bodySmall.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        20.ph,
                        // Hero Animation container
                        Container(
                          height: 180.h,
                          alignment: Alignment.center,
                          child: LottieBuilder.asset(
                            isEmployee
                                ? AppImages.lemployee
                                : AppImages.lmanager,
                            fit: BoxFit.contain,
                          ),
                        ),
                        16.ph,
                        BlocSelector<
                          AuthBloc,
                          AuthState,
                          ActivateAccountState?
                        >(
                          selector: (state) =>
                              state is ActivateAccountState ? state : null,
                          builder: (context, activateState) {
                            if (activateState != null) {
                              return Container(
                                padding: EdgeInsets.all(16.r),
                                decoration: BoxDecoration(
                                  color: context.colors.surface,
                                  borderRadius: BorderRadius.circular(18.r),
                                  border: Border.all(
                                    color: context.colors.primary.withValues(
                                      alpha: 0.25,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'تم إرسال كود التحقق إلى:',
                                      style: context.typography.bodySmall
                                          .copyWith(
                                            color: context.colors.textSecondary,
                                          ),
                                    ),
                                    4.ph,
                                    Text(
                                      bloc.emailCtrl.text,
                                      style: context.typography.titleSmall
                                          .copyWith(
                                            color: context.colors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    14.ph,
                                    AppTextField(
                                      label: 'رمز التحقق (OTP)',
                                      controller: bloc.verificationCode,
                                      type: TextInputType.number,
                                      prefixIcon: Icon(
                                        Icons.pin_rounded,
                                        color: context.colors.primary,
                                        size: 20.r,
                                      ),
                                    ),
                                    16.ph,
                                    AppButton(
                                      title: 'تأكيد الحساب',
                                      onTap: () {
                                        bloc.add(
                                          VerifyEmailEvent(
                                            VerifyParams(
                                              email: activateState.email,
                                              isEmployee: isEmployee,
                                              otp: bloc.verificationCode.text,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AppTextField(
                                  label: 'البريد الإلكتروني',
                                  controller: bloc.emailCtrl,
                                  isEmail: true,
                                  type: TextInputType.emailAddress,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: context.colors.primary,
                                    size: 20.r,
                                  ),
                                ),
                                8.ph,
                                AppTextField(
                                  label: 'كلمة المرور',
                                  controller: bloc.passwordCtrl,
                                  isPassword: true,
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: context.colors.primary,
                                    size: 20.r,
                                  ),
                                ),
                                8.ph,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () => showDialog<void>(
                                      context: context,
                                      builder: (context) => ResetPasswordDialog(
                                        isEmployee: isEmployee,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: context.colors.primary,
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      'نسيت كلمة المرور؟',
                                      style: context.typography.bodySmall
                                          .copyWith(
                                            color: context.colors.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                12.ph,
                                BlocSelector<AuthBloc, AuthState, bool>(
                                  selector: (state) =>
                                      state is AuthLoadingState,
                                  builder: (context, isLoading) => AppButton(
                                    title: 'تسجيل الدخول',
                                    isLoading: isLoading,
                                    onTap: () {
                                      if (!bloc.formKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      bloc.add(
                                        isEmployee
                                            ? const EmployeeSignInEvent()
                                            : const ManagerSignInEvent(),
                                      );
                                    },
                                  ),
                                ),
                                12.ph,
                                BlocSelector<AuthBloc, AuthState, String?>(
                                  selector: (state) => state is AuthFailureState
                                      ? state.error
                                      : null,
                                  builder: (context, error) {
                                    if (error == null) {
                                      return const SizedBox.shrink();
                                    }
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 10.h,
                                      ),
                                      margin: EdgeInsets.only(bottom: 12.h),
                                      decoration: BoxDecoration(
                                        color: context.colors.error.withValues(
                                          alpha: 0.15,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: context.colors.error
                                              .withValues(alpha: 0.4),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.error_outline_rounded,
                                            color: context.colors.error,
                                            size: 20.r,
                                          ),
                                          10.pw,
                                          Expanded(
                                            child: Text(
                                              error,
                                              style: context
                                                  .typography
                                                  .bodySmall
                                                  .copyWith(
                                                    color: context.colors.error,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ليس لديك حساب؟ ',
                                      style: context.typography.bodySmall
                                          .copyWith(
                                            color: context.colors.textSecondary,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          NavigationHelper.nextScreenReplaceNamed(
                                            context,
                                            isEmployee
                                                ? EmployeeSignUpScreen.routeName
                                                : ManagerSignUpScreen.routeName,
                                          ),
                                      child: Text(
                                        'سجل الآن',
                                        style: context.typography.bodySmall
                                            .copyWith(
                                              color: context.colors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                24.ph,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
