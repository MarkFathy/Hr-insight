import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';

class AppErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;

  const AppErrorState({
    required this.message,
    super.key,
    this.onRetry,
    this.retryLabel,
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
                  color: context.colors.error.withValues(alpha: 0.15),
                  border: Border.all(
                    color: context.colors.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 34.r,
                  color: context.colors.error,
                ),
              ),
              16.ph,
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.typography.body.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              () {
                final currentRetry = onRetry;
                if (currentRetry != null) {
                  return Column(
                    children: [
                      20.ph,
                      AppButton(
                        title: retryLabel ?? 'إعادة المحاولة',
                        onTap: currentRetry,
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
