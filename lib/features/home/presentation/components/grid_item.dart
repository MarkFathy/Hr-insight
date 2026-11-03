import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/entrance_fader.dart';
import 'package:hr_app/core/utils/extensions.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    required this.asset,
    required this.title,
    required this.onTap,
    super.key,
    this.subtitle,
    this.icon,
  });

  final String asset;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => EntranceFader(
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: context.colors.primary.withValues(alpha: 0.15),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 66,
                  height: 66,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Image.asset(
                    asset,
                    fit: BoxFit.contain,
                  ),
                ),
                14.ph,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.titleMedium.copyWith(
                    color: context.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5,
                  ),
                ),
                if (subtitle != null) ...[
                  6.ph,
                  Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.typography.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
