import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/core/shared_widgets/app_indicator.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/components/form_1.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/components/form_2.dart';
import 'package:hr_app/src/injector.dart';

class EmployeeSignUpScreen extends StatelessWidget {
  static const routeName = '/employee-signup';
  const EmployeeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = [];
    int currentIndx = 0;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              // dGN (2:297)
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: StatefulBuilder(
                builder: (context, changeState) {
                  return BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                    if (state is AuthSuccessState) {
                      Phoenix.rebirth(context);
                    }
                    if (state is AuthFailureState) {
                      showBar(state.error, context);
                    }
                  }, builder: (context, state) {
                    final bloc = context.read<AuthBloc>();
                    forms = const [Form1(), Form2()];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.ph,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.r),
                              child: IconButton(
                                  onPressed: () => NV.pop(context),
                                  icon: const Icon(Icons.arrow_back_ios,),
                                 color: Colors.white
                              ),
                            )
                          ],
                        ),
                        // 40.ph,
                        // AnimatedSwitch(
                        //     child: Image.asset(
                        //   images[currentIndx],
                        //   width: 296.r,
                        // )),
                        10.r.ph,
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom * .4),
                          child: Form(
                              key: bloc.formKey,
                              child: AnimatedSwitch(
                                  child: state is EmailVerifiedState
                                      ? Column(
                                          children: [
                                            20.ph,
                                            Text(
                                                'تم إرسال رمز التحقق الى : ${state.employee!.data!.employee!.email!}'),
                                            20.ph,
                                            STextField(
                                              lable: 'رمز التحقق',
                                              controller: bloc.verificationCode,
                                            ),
                                            state is AuthLoadingState
                                                ? const AppIndicator()
                                                : SButton(
                                                    title: 'تأكيد',
                                                    onTap: () {
                                                      if (!bloc
                                                          .formKey.currentState!
                                                          .validate()) {
                                                        return;
                                                      }
                                                      bloc.add(VerifyEmailEvent(
                                                          VerifyParams(
                                                              email: state
                                                                  .employee!
                                                                  .data!
                                                                  .employee!
                                                                  .email!,
                                                              otp: bloc
                                                                  .verificationCode
                                                                  .text,
                                                              isEmployee: true)));
                                                    }),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            forms[currentIndx],
                                            if (currentIndx > 0 &&
                                                currentIndx != 2 &&
                                                state is! AuthLoadingState)
                                              IconButton(
                                                  onPressed: () {
                                                    if (currentIndx > 0) {
                                                      --currentIndx;
                                                      changeState(() {});
                                                    }
                                                  },
                                                  icon: const Icon(
                                                      Icons.arrow_back_ios)),
                                            if (bloc.info != null)
                                              state is AuthLoadingState
                                                  ? const ButtonIncdicator()
                                                  : SButton(
                                                      title: currentIndx ==
                                                              forms.length - 1
                                                          ? 'انشاء الحساب'
                                                          : 'التالى',
                                                      onTap: () {
                                                        if (!context
                                                            .read<AuthBloc>()
                                                            .formKey
                                                            .currentState!
                                                            .validate()) return;
                                                        switch (currentIndx) {
                                                          case 0:
                                                            {
                                                              if (bloc.departId ==
                                                                  null) {
                                                                showBar(
                                                                    'اختر القسم',
                                                                    context);
                                                                return;
                                                              }
                                                              if (bloc.officeId ==
                                                                  null) {
                                                                showBar(
                                                                    'اختر المكتب',
                                                                    context);
                                                                return;
                                                              }
                                                              if (bloc.jobId ==
                                                                  null) {
                                                                showBar(
                                                                    'اختر المسمى الوظيفى',
                                                                    context);
                                                                return;
                                                              }
                                                              changeState(() {
                                                                ++currentIndx;
                                                              });
                                                            }
                                                          case 1:
                                                            {
                                                              if (bloc.profileImage ==
                                                                  null) {
                                                                showBar(
                                                                    'اضف صور الهوية الشخصية',
                                                                    context);
                                                                return;
                                                              }
                                                              context
                                                                  .read<
                                                                      AuthBloc>()
                                                                  .add(
                                                                      EmployeeSignUpEvent());
                                                            }
                                                        }
                                                      }),
                                          ],
                                        ))),
                        ),
                      ],
                    );
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
