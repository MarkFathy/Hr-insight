import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/extensions.dart';

class AppButton extends StatelessWidget {
  final bool outlined;
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  const AppButton({
    required this.title,
    required this.onTap,
    super.key,
    this.outlined = false,
    this.isLoading = false,
    this.icon,
    this.margin,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 48.h;

    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: SizedBox(
        width: width ?? double.infinity,
        height: effectiveHeight,
        child: outlined
            ? OutlinedButton(
                onPressed: isLoading ? null : onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colors.primary,
                  side: BorderSide(color: context.colors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: _buildChild(context, context.colors.primary),
              )
            : ElevatedButton(
                onPressed: isLoading ? null : onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shadowColor: context.colors.primary.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: _buildChild(context, Colors.black),
              ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, Color textColor) {
    if (isLoading) {
      return SizedBox(
        height: 22.r,
        width: 22.r,
        child: CircularProgressIndicator(
          strokeWidth: 2.2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18.r, color: textColor),
          8.pw,
          Text(
            title,
            style: context.typography.labelLarge.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ],
      );
    }

    return Text(
      title,
      style: context.typography.labelLarge.copyWith(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),
    );
  }
}
