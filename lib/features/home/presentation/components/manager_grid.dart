import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_section_header.dart';
import 'package:hr_app/features/home/presentation/components/grid_item.dart';

class ManagerGrid extends StatelessWidget {
  const ManagerGrid({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Section 1: Daily Operations
        const AppSectionHeader(
          title: 'العمليات اليومية',
          icon: Icons.flash_on_rounded,
        ),
        Row(
          children: [
            Expanded(
              child: GridItem(
                asset: AppImages.attendance,
                title: 'حضور الموظفين',
                subtitle: 'متابعة البصمة اليومية',
                onTap: () => NavigationHelper.nextScreenNamed<void>(
                  context,
                  '/manager-attendance',
                ),
              ),
            ),
            14.pw,
            Expanded(
              child: GridItem(
                asset: AppImages.leaves,
                title: 'طلبات الإجازات',
                subtitle: 'الموافقة والرفض',
                onTap: () => NavigationHelper.nextScreenNamed<void>(
                  context,
                  '/manager-leaves',
                ),
              ),
            ),
          ],
        ),
        20.ph,
        // Section 2: Organization & Company Structure
        const AppSectionHeader(
          title: 'إدارة الهيكل المؤسسي',
          icon: Icons.corporate_fare_rounded,
        ),
        Row(
          children: [
            Expanded(
              child: GridItem(
                asset: AppImages.office,
                title: 'الفروع والمكاتب',
                subtitle: 'المواقع والنطاق الجغرافي',
                onTap: () =>
                    NavigationHelper.nextScreenNamed<void>(context, '/offices'),
              ),
            ),
            14.pw,
            Expanded(
              child: GridItem(
                asset: AppImages.employee,
                title: 'فريق الموظفين',
                subtitle: 'سجلات وبيانات الفريق',
                onTap: () => NavigationHelper.nextScreenNamed<void>(
                  context,
                  '/employees',
                ),
              ),
            ),
          ],
        ),
        16.ph,
        // Full Width Card for Departments & Jobs
        InkWell(
          onTap: () =>
              NavigationHelper.nextScreenNamed<void>(context, '/departments'),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.colors.primary.withValues(alpha: 0.15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: context.colors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Image.asset(
                    AppImages.departments,
                    cacheWidth: 100,
                    cacheHeight: 100,
                  ),
                ),
                16.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الأقسام والوظائف والمسميات',
                        style: context.typography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      6.ph,
                      Text(
                        'إدارة الهيكل الوظيفي وتعيين المسميات',
                        style: context.typography.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 13,
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
      ],
    ),
  );
}
