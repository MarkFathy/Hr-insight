import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';

/// Confirmation dialog asking the user to confirm logging out of their account.
class LogoutConfirmationDialog extends StatefulWidget {
  final VoidCallback onConfirm;

  const LogoutConfirmationDialog({required this.onConfirm, super.key});

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) => showDialog<void>(
    context: context,
    builder: (ctx) => LogoutConfirmationDialog(onConfirm: onConfirm),
  );

  @override
  State<LogoutConfirmationDialog> createState() =>
      _LogoutConfirmationDialogState();
}

class _LogoutConfirmationDialogState extends State<LogoutConfirmationDialog>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: context.radius.lgBorder,
      side: BorderSide(color: context.colors.error.withValues(alpha: 0.25)),
    ),
    titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    actionsPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
    title: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.colors.error.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.logout_rounded,
            color: context.colors.error,
            size: 20,
          ),
        ),
        12.pw,
        Text(
          'تسجيل الخروج',
          style: context.typography.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
    content: Text(
      'هل أنت متأكد من رغبتك في تسجيل الخروج من الحساب؟',
      style: context.typography.bodySmall.copyWith(
        color: context.colors.textSecondary,
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'إلغاء',
          style: TextStyle(
            color: context.colors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.error,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: context.radius.smBorder),
        ),
        onPressed: () {
          Navigator.pop(context);
          widget.onConfirm();
        },
        icon: const Icon(Icons.logout_rounded, size: 18),
        label: const Text(
          'تأكيد الخروج',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
