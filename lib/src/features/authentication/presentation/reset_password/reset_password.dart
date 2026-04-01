import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/core/shared_widgets/app_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';

class ResetPassword extends StatelessWidget {
  final bool isEmployee;
  const ResetPassword({super.key, required this.isEmployee});

  @override
  Widget build(context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: MyColors.greyColor,
      child: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is PasswordResettedState) {
              Phoenix.rebirth(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'إعادة تعيين كلمة المرور',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.reset,
                      height: 120.r,
                    ),
                  ),
                  if (state is AuthFailureState)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.error),
                    ),
                  if (bloc.employee == null && bloc.manager == null) ...[
                    STextField(
                      lable: 'البريد الإلكترونى',
                      controller: bloc.emailCtrl,
                      enabled: state is! ForgetPasswordState,
                      isEmail: true,
                    ),
                    if (state is ForgetPasswordState)
                      STextField(
                        lable: 'رمز التحقق',
                        controller: bloc.verificationCode,
                      ),
                    10.ph,
                    AnimatedSwitch(
                      isFadeTransition: true,
                      child: (state is AuthLoadingState)
                          ? const AppIndicator()
                          : state is ForgetPasswordState
                              ? SButton(
                                  title: 'تم',
                                  onTap: () {
                                    bloc.add(VerifyEmailEvent(VerifyParams(
                                        email: bloc.emailCtrl.text,
                                        isEmployee: isEmployee,
                                        otp: bloc.verificationCode.text)));
                                  })
                              : SButton(
                                  title: 'إرسال الرمز',
                                  onTap: () {
                                    bloc.add(ForgetPasswordEvent(isEmployee));
                                  }),
                    )
                  ],
                  if (state is AuthSuccessState) ...[
                    STextField(
                      lable: 'كلمة المرور الجديدة',
                      controller: bloc.passwordCtrl,
                      isPassword: true,
                    ),
                    STextField(
                      lable: 'تأكيد كلمة المرور',
                      controller: bloc.confirmPasswordCtrl,
                      isPassword: true,
                    ),
                    state is AuthLoadingState
                        ? const AppIndicator()
                        : SButton(
                            title: 'إعادة تعيين',
                            onTap: () {
                              bloc.add(ResetPasswordEvent(ResetPasswordParams(
                                  password: bloc.passwordCtrl.text,
                                  passwordConfirmation:
                                      bloc.confirmPasswordCtrl.text,
                                  isEmployee: isEmployee,
                                  token: bloc.isEmployee
                                      ? bloc.employee!.data!.token!
                                      : bloc.manager!.data!.token!)));
                            })
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
