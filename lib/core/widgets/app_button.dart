import 'package:flutter/material.dart';
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
    final effectiveHeight = height ?? context.sizes.buttonHeight;

    return Padding(
      padding:
          margin ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: effectiveHeight,
          minWidth: width ?? double.infinity,
          maxWidth: width ?? double.infinity,
        ),
        child: outlined
            ? OutlinedButton(
                onPressed: isLoading ? null : onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colors.primary,
                  side: BorderSide(color: context.colors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
                    borderRadius: BorderRadius.circular(14),
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
        height: 22,
        width: 22,
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
          Icon(icon, size: 18, color: textColor),
          8.pw,
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.typography.labelLarge.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    }

    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.typography.labelLarge.copyWith(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
