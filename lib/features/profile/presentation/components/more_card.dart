import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/entrance_fader.dart';
import 'package:hr_app/core/utils/extensions.dart';

class MoreCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isDestructive;

  const MoreCard({
    required this.title,
    required this.onTap,
    super.key,
    this.icon,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor = isDestructive
        ? context.colors.error
        : context.colors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: EntranceFader(
        delay: const Duration(milliseconds: 150),
        child: Material(
          color: context.colors.surface,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.25),
          shape: RoundedRectangleBorder(
            borderRadius: context.radius.mdBorder,
            side: BorderSide(
              color: isDestructive
                  ? context.colors.error.withValues(alpha: 0.3)
                  : context.colors.primary.withValues(alpha: 0.15),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: itemColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: itemColor, size: 18),
                    ),
                    12.pw,
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: context.typography.titleSmall.copyWith(
                        color: isDestructive
                            ? context.colors.error
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: itemColor.withValues(alpha: 0.6),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
