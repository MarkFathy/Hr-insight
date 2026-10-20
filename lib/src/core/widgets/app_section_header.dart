import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 20.r,
                    color: context.colors.primary,
                  ),
                  8.pw,
                ],
                Text(
                  title,
                  style: context.typography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
            if (actionTitle != null && onAction != null)
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: context.colors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(
                  actionTitle!,
                  style: context.typography.labelMedium.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      );
}
