import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/app/router/routing_page.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/animated_switch.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/shared/widgets/app_snack_bar.dart';
import 'package:hr_app/core/shared/widgets/button_indicator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:hr_app/features/authentication/presentation/widgets/employee_account_info_step.dart';
import 'package:hr_app/features/authentication/presentation/widgets/employee_otp_verification_view.dart';
import 'package:hr_app/features/authentication/presentation/widgets/employee_work_info_step.dart';

class EmployeeSignUpPage extends StatefulWidget {
  static const routeName = '/employee-signup';
  const EmployeeSignUpPage({super.key});

  @override
  State<EmployeeSignUpPage> createState() => _EmployeeSignUpPageState();
}

typedef EmployeeSignUpScreen = EmployeeSignUpPage;

class _EmployeeSignUpPageState extends State<EmployeeSignUpPage>
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

  void _handleStepNext(AuthBloc bloc) {
    if (!bloc.formKey.currentState!.validate()) {
      return;
    }
    switch (_currentIndex) {
      case 0:
        if (bloc.departId == null) {
          showBar('اختر القسم', context);
          return;
        }
        if (bloc.officeId == null) {
          showBar('اختر المكتب', context);
          return;
        }
        if (bloc.jobId == null) {
          showBar('اختر المسمى الوظيفى', context);
          return;
        }
        setState(() {
          ++_currentIndex;
        });
        break;
      case 1:
        if (bloc.profileImage == null) {
          showBar('اضف صور الهوية الشخصية', context);
          return;
        }
        bloc.add(
          EmployeeSignUpEvent(
            params: EmployeeRegisterParams(
              name: bloc.nameCtrl.text,
              email: bloc.emailCtrl.text,
              password: bloc.passwordCtrl.text,
              phone: bloc.phoneCtrl.text,
              confirmPassword: bloc.confirmPasswordCtrl.text,
              address: bloc.addressCtrl.text,
              image: bloc.profileImage!,
              managerPin: bloc.managerPin.text,
              jobId: bloc.jobId!,
              departmentId: bloc.departId!,
              officeId: bloc.officeId!,
            ),
          ),
        );
        break;
    }
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
                      RoutingPage.routeName,
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
                            child:
                                BlocSelector<
                                  AuthBloc,
                                  AuthState,
                                  EmailVerifiedState?
                                >(
                                  selector: (state) =>
                                      state is EmailVerifiedState
                                      ? state
                                      : null,
                                  builder: (context, verifiedState) {
                                    final email =
                                        verifiedState
                                            ?.employee
                                            ?.data
                                            ?.employee
                                            ?.email ??
                                        bloc.emailCtrl.text;

                                    return AnimatedSwitch(
                                      child: verifiedState != null
                                          ? EmployeeOtpVerificationView(
                                              email: email,
                                            )
                                          : Column(
                                              children: [
                                                _forms[_currentIndex],
                                                BlocBuilder<
                                                  AuthBloc,
                                                  AuthState
                                                >(
                                                  buildWhen: (prev, curr) =>
                                                      (prev
                                                          is AuthLoadingState) !=
                                                      (curr
                                                          is AuthLoadingState),
                                                  builder: (context, state) {
                                                    if (bloc.info == null) {
                                                      return const SizedBox.shrink();
                                                    }
                                                    return state
                                                            is AuthLoadingState
                                                        ? const ButtonIndicator()
                                                        : AppButton(
                                                            title:
                                                                _currentIndex ==
                                                                    _forms.length -
                                                                        1
                                                                ? 'انشاء الحساب'
                                                                : 'التالى',
                                                            onTap: () =>
                                                                _handleStepNext(
                                                                  bloc,
                                                                ),
                                                          );
                                                  },
                                                ),
                                              ],
                                            ),
                                    );
                                  },
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
