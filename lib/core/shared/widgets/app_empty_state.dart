import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';

class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onAction;

  const AppEmptyState({
    required this.title,
    super.key,
    this.icon = Icons.inbox_outlined,
    this.subtitle,
    this.actionLabel,
    this.actionIcon,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primary.withValues(alpha: 0.12),
              border: Border.all(
                color: context.colors.primary.withValues(alpha: 0.25),
              ),
            ),
            child: Icon(icon, size: 34, color: context.colors.primary),
          ),
          16.ph,
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.typography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.textPrimary,
            ),
          ),
          if (subtitle != null) ...[
            8.ph,
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: context.typography.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
          if (actionLabel case final currentActionLabel?
              when onAction != null) ...[
            20.ph,
            AppButton(
              title: currentActionLabel,
              icon: actionIcon,
              onTap: onAction,
            ),
          ],
        ],
      ),
    ),
  );
}
