import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/animated_switch.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/core/widgets/app_indicator.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/core/widgets/app_text_field.dart';
import 'package:hr_app/src/core/widgets/button_indicator.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/components/employee_account_info_step.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/components/employee_work_info_step.dart';
import 'package:hr_app/src/routing_screen.dart';

class EmployeeSignUpScreen extends StatefulWidget {
  static const routeName = '/employee-signup';
  const EmployeeSignUpScreen({super.key});

  @override
  State<EmployeeSignUpScreen> createState() => _EmployeeSignUpScreenState();
}

class _EmployeeSignUpScreenState extends State<EmployeeSignUpScreen> {
  int _currentIndex = 0;
  static const List<Widget> _forms = [Form1(), Form2()];

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    NavigationHelper.nextScreenCloseOthersNamed(
                      context,
                      RoutingScreen.routeName,
                    );
                  }
                  if (state is AuthFailureState) {
                    showBar(state.error, context);
                  }
                },
                child: Builder(
                  builder: (context) {
                    final bloc = context.read<AuthBloc>();
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppBackButton(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: context.colors.primary.withValues(alpha: 0.25),
                                ),
                              ),
                              child: Text(
                                _currentIndex == 0
                                    ? 'الخطوة 1 من 2: بيانات العمل'
                                    : 'الخطوة 2 من 2: الحساب الشخصي',
                                style: context.typography.labelSmall.copyWith(
                                  color: context.colors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.ph,
                        Padding(
                          padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * .4,
                          ),
                          child: Form(
                            key: bloc.formKey,
                            child: BlocSelector<AuthBloc, AuthState, EmailVerifiedState?>(
                              selector: (state) =>
                                  state is EmailVerifiedState ? state : null,
                              builder: (context, verifiedState) => AnimatedSwitch(
                                  child: verifiedState != null
                                      ? Column(
                                          children: [
                                            20.ph,
                                            Text(
                                              'تم إرسال رمز التحقق الى : ${verifiedState.employee!.data!.employee!.email!}',
                                            ),
                                            20.ph,
                                            AppTextField(
                                              label: 'رمز التحقق',
                                              controller: bloc.verificationCode,
                                            ),
                                            BlocSelector<
                                              AuthBloc,
                                              AuthState,
                                              bool
                                            >(
                                              selector: (state) =>
                                                  state is AuthLoadingState,
                                              builder: (context, isLoading) => isLoading
                                                    ? const AppIndicator()
                                                    : AppButton(
                                                        title: 'تأكيد',
                                                        onTap: () {
                                                          if (!bloc
                                                              .formKey
                                                              .currentState!
                                                              .validate()) {
                                                            return;
                                                          }
                                                          bloc.add(
                                                            VerifyEmailEvent(
                                                              VerifyParams(
                                                                email: verifiedState
                                                                    .employee!
                                                                    .data!
                                                                    .employee!
                                                                    .email!,
                                                                otp: bloc
                                                                    .verificationCode
                                                                    .text,
                                                                isEmployee:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            _forms[_currentIndex],
                                            BlocBuilder<AuthBloc, AuthState>(
                                              buildWhen: (prev, curr) =>
                                                  (prev is AuthLoadingState) !=
                                                  (curr is AuthLoadingState),
                                              builder: (context, state) {
                                                if (bloc.info == null) {
                                                  return const SizedBox.shrink();
                                                }
                                                return state is AuthLoadingState
                                                    ? const ButtonIndicator()
                                                    : AppButton(
                                                        title:
                                                            _currentIndex ==
                                                                _forms.length -
                                                                    1
                                                            ? 'انشاء الحساب'
                                                            : 'التالى',
                                                        onTap: () {
                                                          if (!bloc
                                                              .formKey
                                                              .currentState!
                                                              .validate()) {
                                                            return;
                                                          }
                                                          switch (_currentIndex) {
                                                            case 0:
                                                              if (bloc.departId ==
                                                                  null) {
                                                                showBar(
                                                                  'اختر القسم',
                                                                  context,
                                                                );
                                                                return;
                                                              }
                                                              if (bloc.officeId ==
                                                                  null) {
                                                                showBar(
                                                                  'اختر المكتب',
                                                                  context,
                                                                );
                                                                return;
                                                              }
                                                              if (bloc.jobId ==
                                                                  null) {
                                                                showBar(
                                                                  'اختر المسمى الوظيفى',
                                                                  context,
                                                                );
                                                                return;
                                                              }
                                                              setState(() {
                                                                ++_currentIndex;
                                                              });
                                                              break;
                                                            case 1:
                                                              if (bloc.profileImage ==
                                                                  null) {
                                                                showBar(
                                                                  'اضف صور الهوية الشخصية',
                                                                  context,
                                                                );
                                                                return;
                                                              }
                                                              bloc.add(
                                                                const EmployeeSignUpEvent(),
                                                              );
                                                              break;
                                                          }
                                                        },
                                                      );
                                              },
                                            ),
                                          ],
                                        ),
                                ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
}
