import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extensions.dart';

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
            borderRadius: BorderRadius.circular(18.r),
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
              borderRadius: BorderRadius.circular(18.r),
              side: BorderSide(
                color: context.colors.primary.withValues(alpha: 0.15),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              borderRadius: BorderRadius.circular(18.r),
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 58.r,
                      height: 58.r,
                      padding: EdgeInsets.all(8.r),
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
                    12.ph,
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.typography.titleSmall.copyWith(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    if (subtitle != null) ...[
                      4.ph,
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.typography.caption.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 11.sp,
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
