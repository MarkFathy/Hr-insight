import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/features/profile/presentation/bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProfileInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool selectable;
  const ProfileInfoItem({
    required this.title,
    required this.value,
    super.key,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) =>
      BlocSelector<ProfileBloc, ProfileState, bool>(
        selector: (state) => state is ProfileLoadingState,
        builder: (context, isLoading) => Padding(
          padding: EdgeInsets.symmetric(vertical: 6.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isLoading)
                Shimmer.fromColors(
                  baseColor: Colors.blueGrey.shade700,
                  highlightColor: context.colors.surface,
                  child: Container(
                    width: 70.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                )
              else
                Text(
                  title,
                  style: context.typography.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 12.sp,
                  ),
                ),
              if (selectable)
                InkWell(
                  onTap: () async {
                    if (value.isNotEmpty) {
                      await Clipboard.setData(ClipboardData(text: value));
                      if (context.mounted) {
                        AppSnackBar.showSuccess(
                          context,
                          'تم نسخ كود التسجيل بنجاح',
                        );
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: context.colors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.copy_rounded,
                          size: 14.r,
                          color: context.colors.primary,
                        ),
                        6.pw,
                        Text(
                          value,
                          style: context.typography.titleMedium.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (isLoading)
                Shimmer.fromColors(
                  baseColor: Colors.blueGrey.shade700,
                  highlightColor: context.colors.surface,
                  child: Container(
                    width: 90.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                )
              else
                Text(
                  value.isEmpty ? 'غير متوفر' : value,
                  style: context.typography.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          ),
        ),
      );
}
