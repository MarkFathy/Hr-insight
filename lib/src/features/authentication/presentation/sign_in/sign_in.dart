import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/employee_up.dart';
import 'package:hr_app/src/features/authentication/presentation/manager_sign_up/manager_up.dart';
import 'package:hr_app/src/features/authentication/presentation/reset_password/reset_password.dart';
import 'package:hr_app/src/injector.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isEmployee = ModalRoute.of(context)!.settings.arguments as bool;
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthSuccessState || state is EmailVerifiedState) {
              Phoenix.rebirth(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            return Form(
              key: bloc.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      10.ph,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () => NV.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10.r, 0.r, 0.r, 10.r),
                        child: SText(
                            'تسجيل الدخول كـ${isEmployee ? "موظف" : 'مسؤول'}'),
                      ),
                      Flexible(
                        child: LottieBuilder.asset(isEmployee
                            ? AppImages.lemployee
                            : AppImages.lmanager),
                      ),
                      state is ActivateAccountState
                          ? Column(
                              children: [
                                Text(
                                    'تم ارسال كود التحقق الى ${bloc.emailCtrl.text}'),
                                STextField(
                                  lable: 'رمز التحقق',
                                  controller: bloc.verificationCode,
                                ),
                                SButton(
                                    onTap: () {
                                      bloc.add(VerifyEmailEvent(VerifyParams(
                                          email: state.email,
                                          isEmployee: isEmployee,
                                          otp: bloc.verificationCode.text)));
                                    },
                                    title: 'تأكيد')
                              ],
                            )
                          : Column(
                              children: [
                                STextField(
                                  lable: 'البريد الالكتروني',
                                  controller: bloc.emailCtrl,
                                  isEmail: true,
                                ),
                                5.ph,
                                STextField(
                                  lable: 'كلمه المرور',
                                  controller: bloc.passwordCtrl,
                                  isPassword: true,
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.r),
                                      child: InkWell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ResetPassword(
                                                    isEmployee: isEmployee,
                                                  )),
                                          child:
                                              const SText('نسيت كلمة المرور؟')),
                                    ),
                                  ],
                                ),
                                10.ph,
                                Column(
                                  children: [
                                    state is AuthLoadingState
                                        ? const ButtonIncdicator()
                                        : SButton(
                                            title: 'تسجيل الدخـول',
                                            onTap: () {
                                              if (!bloc.formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }
                                              bloc.add(isEmployee
                                                  ? EmployeeSignInEvent()
                                                  : ManagerSignInEvent());
                                            }),
                                    if (state is AuthFailureState)
                                     Chip(
  label: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.error, color: Colors.red),
      10.pw,
      Flexible(
        child: SText(
          state.error,
          color: Colors.red,
          fontSize: 11.r,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),
)
                                  ],
                                ),
                                MediaQuery.of(context).viewInsets.bottom.ph,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'ليس لديك حساب؟ ',
                                      ),
                                      InkWell(
                                          onTap: () =>
                                              NV.nextScreenReplaceNamed(
                                                  context,
                                                  isEmployee
                                                      ? EmployeeSignUpScreen
                                                          .routeName
                                                      : ManagerSignUpScreen
                                                          .routeName),
                                          child: SText(
                                            'سجل الآن',
                                            fontSize: 15.r,
                                            color: theme.primaryColor,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),  
                      MediaQuery.of(context).viewInsets.bottom.ph,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
