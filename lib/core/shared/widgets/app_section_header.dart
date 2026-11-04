import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final VoidCallback? onAction;
  final IconData? icon;

  const AppSectionHeader({
    required this.title,
    super.key,
    this.actionTitle,
    this.onAction,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 22, color: context.colors.primary),
                10.pw,
              ],
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.textPrimary,
                    fontSize: 16.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (actionTitle != null && onAction != null) ...[
          8.pw,
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              foregroundColor: context.colors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              visualDensity: VisualDensity.compact,
            ),
            child: Text(
              actionTitle!,
              style: context.typography.labelMedium.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
