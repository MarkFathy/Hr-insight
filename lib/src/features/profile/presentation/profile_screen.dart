import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/constants/app_images.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/components/change_password_sheet.dart';
import 'package:hr_app/src/features/profile/presentation/components/more_card.dart';
import 'package:hr_app/src/features/profile/presentation/components/user_card.dart';

class ProfileScreen extends StatelessWidget {
  final bool isEmployee;
  const ProfileScreen({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) =>
          sl<ProfileBloc>()..add(GetProfileEvent(isEmployee: isEmployee)),
      child: Builder(
        builder: (screenCtx) => Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              color: screenCtx.colors.primary,
              backgroundColor: screenCtx.colors.surface,
              onRefresh: () async {
                screenCtx
                    .read<ProfileBloc>()
                    .add(GetProfileEvent(isEmployee: isEmployee));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    UserCard(isEmployee: isEmployee),
                    10.ph,
                    if (isEmployee)
                      MoreCard(
                        title: 'تغيير كلمة المرور',
                        icon: Icons.lock_reset_rounded,
                        onTap: () {
                          unawaited(
                            showModalBottomSheet<void>(
                              context: screenCtx,
                              isScrollControlled: true,
                              useSafeArea: true,
                              builder: (context) =>
                                  ChangePasswordSheet(isEmployee: isEmployee),
                            ),
                          );
                        },
                      ),
                    MoreCard(
                      title: 'حذف الحساب نهائياً',
                      icon: Icons.delete_forever_rounded,
                      isDestructive: true,
                      onTap: () => _showDeleteAccountDialog(screenCtx),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 32.h,
                        bottom: (size.height * .08).h,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.logo,
                          height: 100.r,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    120.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (dialogCtx) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: _DeleteAccountDialog(
            isEmployee: isEmployee,
            parentContext: context,
          ),
        ),
      ),
    );
  }
}

class _DeleteAccountDialog extends StatefulWidget {
  final bool isEmployee;
  final BuildContext parentContext;

  const _DeleteAccountDialog({
    required this.isEmployee,
    required this.parentContext,
  });

  @override
  State<_DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<_DeleteAccountDialog> {
  late final TextEditingController _passwordController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AccountDeletedState) {
          Navigator.pop(context);
          if (widget.parentContext.mounted) {
            AppSnackBar.showSuccess(widget.parentContext, state.message);
            Navigator.pushNamedAndRemoveUntil(
              widget.parentContext,
              '/intro',
              (route) => false,
            );
          }
        } else if (state is AuthFailureState) {
          final isUnauthenticated =
              state.error.toLowerCase().contains('unauthenticated') ||
              state.error.contains('401');

          if (isUnauthenticated) {
            Navigator.pop(context);
            if (widget.parentContext.mounted) {
              AppSnackBar.showError(
                widget.parentContext,
                'انتهت الجلسة، يرجى تسجيل الدخول مجدداً',
              );
              Navigator.pushNamedAndRemoveUntil(
                widget.parentContext,
                '/intro',
                (route) => false,
              );
            }
          } else {
            setState(() {
              _errorMessage = state.error;
            });
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoadingState;

        return AlertDialog(
          backgroundColor: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: context.radius.mdBorder,
            side: BorderSide(
              color: context.colors.error.withValues(alpha: 0.3),
            ),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: context.colors.error,
                size: 22.r,
              ),
              8.pw,
              Text(
                'تأكيد حذف الحساب',
                style: context.typography.titleMedium.copyWith(
                  color: context.colors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'سيؤدي هذا الإجراء إلى حذف حسابك وجميع بياناتك نهائياً دون إمكانية الاسترجاع.',
                style: context.typography.bodySmall.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              12.ph,
              TextField(
                controller: _passwordController,
                obscureText: true,
                enabled: !isLoading,
                style: const TextStyle(color: Colors.white),
                onChanged: (_) {
                  if (_errorMessage != null) {
                    setState(() {
                      _errorMessage = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: 'كلمة المرور لتأكيد الحذف',
                  errorText: _errorMessage,
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: context.radius.smBorder,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.error,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: context.radius.smBorder,
                ),
              ),
              onPressed: isLoading ? null : _onDeletePressed,
              child: isLoading
                  ? SizedBox(
                      width: 18.r,
                      height: 18.r,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('حذف نهائي'),
            ),
          ],
        );
      },
    );

  void _onDeletePressed() {
    final password = _passwordController.text.trim();
    if (password.isEmpty) {
      setState(() {
        _errorMessage = 'يرجى إدخال كلمة المرور';
      });
      return;
    }

    context.read<AuthBloc>().add(
          AuthEvent.deleteAccount(
            AccountDeleteParams(
              password: password,
              isEmployee: widget.isEmployee,
            ),
          ),
        );
  }
}
