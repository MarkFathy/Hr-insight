import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 8),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: context.radius.mdBorder,
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: context.radius.mdBorder,
            onTap: onPressed ?? () => NavigationHelper.pop(context),
            child: Center(
              child: Icon(
                isRtl
                    ? Icons.arrow_forward_ios_rounded
                    : Icons.arrow_back_ios_new_rounded,
                color: context.colors.primary,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
