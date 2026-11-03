import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/routing_screen.dart';

class ResetPasswordDialog extends StatefulWidget {
  final bool isEmployee;
  const ResetPasswordDialog({required this.isEmployee, super.key});

  @override
  State<ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog>
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
    final isEmployee = widget.isEmployee;

    return Dialog(
      backgroundColor: context.colors.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: context.colors.primary.withValues(alpha: 0.25)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: BlocProvider.value(
          value: _bloc,
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is PasswordResettedState) {
                NavigationHelper.nextScreenCloseOthersNamed(
                  context,
                  RoutingScreen.routeName,
                );
              }
            },
            child: Builder(
              builder: (context) {
                final bloc = context.read<AuthBloc>();

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Top bar: title + close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'إعادة تعيين كلمة المرور',
                              style: context.typography.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colors.primary,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close_rounded,
                                color: Colors.white70,
                              ),
                              onPressed: () => NavigationHelper.pop(context),
                            ),
                          ],
                        ),
                        10.ph,
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.colors.surfaceContainer,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: context.colors.primary.withValues(
                                  alpha: 0.25,
                                ),
                              ),
                            ),
                            child: Image.asset(
                              AppImages.reset,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        16.ph,
                        BlocSelector<AuthBloc, AuthState, String?>(
                          selector: (state) =>
                              state is AuthFailureState ? state.error : null,
                          builder: (context, error) {
                            if (error == null) return const SizedBox.shrink();
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.error.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: context.colors.error.withValues(
                                    alpha: 0.4,
                                  ),
                                ),
                              ),
                              child: Text(
                                error,
                                style: context.typography.caption.copyWith(
                                  color: context.colors.error,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (prev, curr) =>
                              (curr is ForgetPasswordState) !=
                                  (prev is ForgetPasswordState) ||
                              (curr is AuthSuccessState) !=
                                  (prev is AuthSuccessState) ||
                              (curr is AuthLoadingState) !=
                                  (prev is AuthLoadingState),
                          builder: (context, state) {
                            final isLoading = state is AuthLoadingState;

                            if (bloc.employee == null && bloc.manager == null) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppTextField(
                                    label: 'البريد الإلكتروني',
                                    controller: bloc.emailCtrl,
                                    enabled: state is! ForgetPasswordState,
                                    isEmail: true,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: context.colors.primary,
                                      size: 18,
                                    ),
                                  ),
                                  if (state is ForgetPasswordState) ...[
                                    8.ph,
                                    AppTextField(
                                      label: 'رمز التحقق (OTP)',
                                      controller: bloc.verificationCode,
                                      type: TextInputType.number,
                                      prefixIcon: Icon(
                                        Icons.pin_rounded,
                                        color: context.colors.primary,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                  16.ph,
                                  if (state is ForgetPasswordState)
                                    AppButton(
                                      title: 'تأكيد الرمز',
                                      isLoading: isLoading,
                                      onTap: () {
                                        bloc.add(
                                          VerifyEmailEvent(
                                            VerifyParams(
                                              email: bloc.emailCtrl.text,
                                              isEmployee: isEmployee,
                                              otp: bloc.verificationCode.text,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  else
                                    AppButton(
                                      title: 'إرسال رمز التحقق',
                                      isLoading: isLoading,
                                      onTap: () {
                                        bloc.add(
                                          ForgetPasswordEvent(
                                            isEmployee: isEmployee,
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              );
                            }

                            if (state is AuthSuccessState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppTextField(
                                    label: 'كلمة المرور الجديدة',
                                    controller: bloc.passwordCtrl,
                                    isPassword: true,
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: context.colors.primary,
                                      size: 18,
                                    ),
                                  ),
                                  8.ph,
                                  AppTextField(
                                    label: 'تأكيد كلمة المرور',
                                    controller: bloc.confirmPasswordCtrl,
                                    isPassword: true,
                                    prefixIcon: Icon(
                                      Icons.lock_reset_rounded,
                                      color: context.colors.primary,
                                      size: 18,
                                    ),
                                  ),
                                  16.ph,
                                  AppButton(
                                    title: 'إعادة تعيين كلمة المرور',
                                    isLoading: isLoading,
                                    onTap: () {
                                      final token = bloc.isEmployee
                                          ? bloc.employee?.data?.token
                                          : bloc.manager?.data?.token;

                                      if (token == null) return;

                                      bloc.add(
                                        ResetPasswordEvent(
                                          ResetPasswordParams(
                                            password: bloc.passwordCtrl.text,
                                            passwordConfirmation:
                                                bloc.confirmPasswordCtrl.text,
                                            isEmployee: isEmployee,
                                            token: token,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                        10.ph,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
