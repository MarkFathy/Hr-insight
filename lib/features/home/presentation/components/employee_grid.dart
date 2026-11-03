import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/leave_form.dart';
import 'package:hr_app/features/home/presentation/components/grid_item.dart';

class EmployeeGrid extends StatelessWidget {
  const EmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Quick Action: Request Leave Featured Banner
        InkWell(
          onTap: () => showDialog<void>(
            context: context,
            builder: (context) => const LeaveForm(),
          ),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colors.surface,
                  context.colors.surfaceContainer,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(20),
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
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: context.colors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    color: context.colors.primary,
                    size: 28,
                  ),
                ),
                16.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تقديم طلب إجازة جديد',
                        style: context.typography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.5,
                        ),
                      ),
                      6.ph,
                      Text(
                        'إرسال طلب إجازة اعتيادية أو عارضة للإدارة',
                        style: context.typography.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.colors.primary,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        22.ph,
        // 2-Column Balanced Grid for Records
        Row(
          children: [
            Expanded(
              child: GridItem(
                asset: AppImages.attendance,
                title: 'سجل الحضور الشهري',
                subtitle: 'عرض تقويم الحضور',
                onTap: () => NavigationHelper.nextScreenNamed<void>(
                  context,
                  '/attendance',
                ),
              ),
            ),
            14.pw,
            Expanded(
              child: GridItem(
                asset: AppImages.leaves,
                title: 'طلبات الإجازات',
                subtitle: 'متابعة حالة الطلبات',
                onTap: () =>
                    NavigationHelper.nextScreenNamed<void>(context, '/leaves'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
