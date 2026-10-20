import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
            vertical: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72.r,
                height: 72.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.primary.withValues(alpha: 0.12),
                  border: Border.all(
                    color: context.colors.primary.withValues(alpha: 0.25),
                  ),
                ),
                child: Icon(
                  icon,
                  size: 34.r,
                  color: context.colors.primary,
                ),
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
              () {
                final currentActionLabel = actionLabel;
                final currentOnAction = onAction;
                if (currentActionLabel != null && currentOnAction != null) {
                  return Column(
                    children: [
                      20.ph,
                      AppButton(
                        title: currentActionLabel,
                        icon: actionIcon,
                        onTap: currentOnAction,
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }(),
            ],
          ),
        ),
      );
}
