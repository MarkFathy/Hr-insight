import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/animated_switch.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_indicator.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/core/widgets/button_indicator.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/features/authentication/presentation/employee_sign_up/components/employee_account_info_step.dart';
import 'package:hr_app/features/authentication/presentation/employee_sign_up/components/employee_work_info_step.dart';
import 'package:hr_app/routing_screen.dart';

class EmployeeSignUpScreen extends StatefulWidget {
  static const routeName = '/employee-signup';
  const EmployeeSignUpScreen({super.key});

  @override
  State<EmployeeSignUpScreen> createState() => _EmployeeSignUpScreenState();
}

class _EmployeeSignUpScreenState extends State<EmployeeSignUpScreen>
    with AutoConnectivityRestoreMixin {
  int _currentIndex = 0;
  static const List<Widget> _forms = [
    EmployeeWorkInfoStep(),
    EmployeeAccountInfoStep(),
  ];
  late final AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AuthBloc>();
  }

  @override
  void onConnectivityRestored() {
    if (_bloc.info == null && _bloc.managerPin.text.trim().isNotEmpty) {
      _bloc.add(const GetDepartmentsEvent());
    }
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _bloc,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 520,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.primary.withValues(
                                  alpha: 0.12,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.colors.primary.withValues(
                                    alpha: 0.25,
                                  ),
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
                                MediaQuery.viewInsetsOf(context).bottom * .4,
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
                                            builder: (context, isLoading) =>
                                                isLoading
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
                                                            isEmployee: true,
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
                                                              _forms.length - 1
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
    ),
  );
}
