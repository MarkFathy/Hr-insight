import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/features/authentication/presentation/employee_sign_up/employee_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/manager_sign_up/manager_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/sign_in/sign_in_screen.dart';

class RoleIntroView extends StatefulWidget {
  final bool isManager;

  const RoleIntroView({required this.isManager, super.key});

  @override
  State<RoleIntroView> createState() => _RoleIntroViewState();
}

class _RoleIntroViewState extends State<RoleIntroView>
    with AutoConnectivityRestoreMixin {
  late Image centerImage;

  @override
  void onConnectivityRestored() {}

  @override
  void initState() {
    super.initState();
    centerImage = Image.asset(
      widget.isManager
          ? AppImages.managerIntroCenter
          : AppImages.employeeIntroCenter,
      fit: BoxFit.contain,
    );
  }

  @override
  void didChangeDependencies() {
    unawaited(precacheImage(centerImage.image, context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ResponsiveContainer(
        maxWidth: 520,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: AppBackButton(),
            ),
            16.ph,
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: context.colors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.isManager
                          ? Icons.admin_panel_settings_rounded
                          : Icons.badge_rounded,
                      color: context.colors.primary,
                      size: 18,
                    ),
                    8.pw,
                    Text(
                      widget.isManager ? 'لوحة تحكم المسؤول' : 'بوابة الموظف',
                      style: context.typography.titleSmall.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            12.ph,
            Text(
              widget.isManager ? 'إدارة ذكية وشاملة' : 'مرحباً بك مجدداً',
              textAlign: TextAlign.center,
              style: context.typography.h2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            6.ph,
            Text(
              widget.isManager
                  ? 'تحكم كامل في الفروع، الموظفين، وسجلات الحضور والإنصراف'
                  : 'سجل حضورك الذكي وتابع طلبات الإجازات بكل سهولة',
              textAlign: TextAlign.center,
              style: context.typography.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: centerImage,
              ),
            ),
            AppButton(
              title: 'تسجيل الدخول',
              onTap: () => NavigationHelper.nextScreenNamed<void>(
                context,
                SignInScreen.routeName,
                args: !widget.isManager,
              ),
            ),
            AppButton(
              title: widget.isManager
                  ? 'إنشاء حساب مسؤول جديد'
                  : 'إنشاء حساب موظف جديد',
              outlined: true,
              onTap: () => NavigationHelper.nextScreenNamed<void>(
                context,
                widget.isManager
                    ? ManagerSignUpScreen.routeName
                    : EmployeeSignUpScreen.routeName,
              ),
            ),
            12.ph,
          ],
        ),
      ),
    ),
  );
}
