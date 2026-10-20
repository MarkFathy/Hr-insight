import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/constants/app_images.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_form.dart';
import 'package:hr_app/src/features/home/presentation/components/grid_item.dart';

class EmployeeGrid extends StatelessWidget {
  const EmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Quick Action: Request Leave Featured Banner
            InkWell(
              onTap: () => showDialog<void>(
                context: context,
                builder: (context) => const LeaveForm(),
              ),
              borderRadius: BorderRadius.circular(18.r),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colors.surface,
                      context.colors.surfaceContainer,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(
                    color: context.colors.primary.withValues(alpha: 0.25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: context.colors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: context.colors.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: context.colors.primary,
                        size: 26.r,
                      ),
                    ),
                    14.pw,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تقديم طلب إجازة جديد',
                            style: context.typography.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          4.ph,
                          Text(
                            'إرسال طلب إجازة اعتيادية أو عارضة للإدارة',
                            style: context.typography.caption.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: context.colors.primary,
                      size: 16.r,
                    ),
                  ],
                ),
              ),
            ),
            16.ph,
            // 2-Column Balanced Grid for Records
            Row(
              children: [
                Expanded(
                  child: GridItem(
                    asset: AppImages.attendance,
                    title: 'سجل الحضور الشهري',
                    subtitle: 'عرض تقويم الحضور',
                    onTap: () => NavigationHelper.nextScreenNamed<void>(context, '/attendance'),
                  ),
                ),
                12.pw,
                Expanded(
                  child: GridItem(
                    asset: AppImages.leaves,
                    title: 'طلبات الإجازات',
                    subtitle: 'متابعة حالة الطلبات',
                    onTap: () => NavigationHelper.nextScreenNamed<void>(context, '/leaves'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
