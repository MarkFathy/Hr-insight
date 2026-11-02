import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';

class ChangePasswordSheet extends StatefulWidget {
  const ChangePasswordSheet({required this.isEmployee, super.key});
  final bool isEmployee;

  @override
  State<ChangePasswordSheet> createState() => _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends State<ChangePasswordSheet>
    with AutoConnectivityRestoreMixin {
  late final AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AuthBloc>()..add(const AutoLoginEvent());
  }

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.colors.surface,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    padding: EdgeInsets.only(
      bottom: MediaQuery.viewInsetsOf(context).bottom + 20.r,
    ),
    child: BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PasswordChangedState) {
            Navigator.pop(context);
            AppSnackBar.showSuccess(context, state.message);
          }
        },
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();
          final isLoading = state is AuthLoadingState;

          return Form(
            key: bloc.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    12.ph,
                    // Drag handle
                    Center(
                      child: Container(
                        width: 40.r,
                        height: 4.r,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                    16.ph,
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: context.colors.primary.withValues(
                              alpha: 0.15,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_reset_rounded,
                            color: context.colors.primary,
                            size: 20.r,
                          ),
                        ),
                        10.pw,
                        Text(
                          'تغيير كلمة المرور',
                          style: context.typography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    AppTextField(
                      label: 'كلمة المرور الحالية',
                      controller: bloc.oldPassword,
                      isPassword: true,
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'يرجى إدخال كلمة المرور الحالية';
                        }
                        return null;
                      },
                    ),
                    12.ph,
                    AppTextField(
                      label: 'كلمة المرور الجديدة',
                      controller: bloc.passwordCtrl,
                      isPassword: true,
                      prefixIcon: const Icon(Icons.key_rounded),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
                        }
                        return null;
                      },
                    ),
                    12.ph,
                    AppTextField(
                      label: 'تأكيد كلمة المرور الجديدة',
                      controller: bloc.confirmPasswordCtrl,
                      isPassword: true,
                      prefixIcon: const Icon(
                        Icons.check_circle_outline_rounded,
                      ),
                      validator: (value) {
                        if (value != bloc.passwordCtrl.text) {
                          return 'كلمة المرور غير متطابقة';
                        }
                        return null;
                      },
                    ),
                    if (state is AuthFailureState) ...[
                      12.ph,
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: context.colors.error.withValues(alpha: 0.12),
                          borderRadius: context.radius.smBorder,
                          border: Border.all(
                            color: context.colors.error.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          state.error,
                          style: TextStyle(
                            color: context.colors.error,
                            fontSize: 12.r,
                          ),
                        ),
                      ),
                    ],
                    20.ph,
                    AppButton(
                      title: 'تأكيد تغيير كلمة المرور',
                      isLoading: isLoading,
                      icon: Icons.check_rounded,
                      onTap: () {
                        if (!bloc.formKey.currentState!.validate()) {
                          return;
                        }
                        bloc.add(
                          ChangePasswordEvent(isEmployee: widget.isEmployee),
                        );
                      },
                    ),
                    10.ph,
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
