import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/intro/employee_intro_screen.dart';
import 'package:hr_app/features/intro/manager_intro_screen.dart';

class UserTypeScreen extends StatefulWidget {
  static const routeName = '/user-type';
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ResponsiveContainer(
        maxWidth: 520,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    // Brand Header
                    Center(
                      child: Container(
                        width: 76,
                        height: 76,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: context.colors.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: context.colors.primary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: context.colors.primary.withValues(
                                alpha: 0.15,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Image.asset(AppImages.logo, fit: BoxFit.contain),
                      ),
                    ),
                    20.ph,
                    Text(
                      'مرحباً بك في HR INSIGHT',
                      textAlign: TextAlign.center,
                      style: context.typography.h2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    8.ph,
                    Text(
                      'يرجى تحديد نوع حسابك للبدء في استخدام النظام',
                      textAlign: TextAlign.center,
                      style: context.typography.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    32.ph,
                    // Manager Card Option
                    _RoleCard(
                      title: 'مسؤول النظام / المدير',
                      subtitle:
                          'إدارة الموظفين، الفروع، الأقسام، واعتماد طلبات الإجازات',
                      icon: Icons.admin_panel_settings_rounded,
                      badgeText: 'إدارة الشركة',
                      onTap: () => NavigationHelper.nextScreenNamed<void>(
                        context,
                        ManagerIntroScreen.routeName,
                      ),
                    ),
                    16.ph,
                    // Employee Card Option
                    _RoleCard(
                      title: 'الموظف',
                      subtitle:
                          'تسجيل الحضور والانصراف بالبصمة، وتقديم طلبات الإجازات',
                      icon: Icons.badge_rounded,
                      badgeText: 'بوابة الموظف',
                      onTap: () => NavigationHelper.nextScreenNamed<void>(
                        context,
                        EmployeeIntroScreen.routeName,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String badgeText;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.badgeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colors.primary.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.colors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(icon, color: context.colors.primary, size: 28),
          ),
          16.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: context.typography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    8.pw,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badgeText,
                        style: context.typography.caption.copyWith(
                          color: context.colors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                6.ph,
                Text(
                  subtitle,
                  style: context.typography.caption.copyWith(
                    color: context.colors.textSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          8.pw,
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.colors.primary,
            size: 16,
          ),
        ],
      ),
    ),
  );
}
