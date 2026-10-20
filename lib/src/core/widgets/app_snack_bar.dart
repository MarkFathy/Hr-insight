import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';

void showBar(
  String text,
  BuildContext context, {
  bool isError = false,
  bool isSuccess = false,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();

  final bgColor = isError
      ? context.colors.error
      : isSuccess
          ? context.colors.success
          : context.colors.surface;

  final icon = isError
      ? Icons.error_outline_rounded
      : isSuccess
          ? Icons.check_circle_outline_rounded
          : Icons.info_outline_rounded;

  scaffoldMessenger.showSnackBar(
    SnackBar(
      backgroundColor: bgColor,
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(
          color: isError || isSuccess
              ? Colors.white24
              : context.colors.primary.withValues(alpha: 0.3),
        ),
      ),
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      content: Row(
        children: [
          Icon(
            icon,
            color: isError || isSuccess ? Colors.white : context.colors.primary,
            size: 20.r,
          ),
          12.pw,
          Expanded(
            child: Text(
              text,
              style: context.typography.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

abstract final class AppSnackBar {
  static void showSuccess(BuildContext context, String message) =>
      showBar(message, context, isSuccess: true);
  static void showError(BuildContext context, String message) =>
      showBar(message, context, isError: true);
  static void showInfo(BuildContext context, String message) =>
      showBar(message, context);
}
