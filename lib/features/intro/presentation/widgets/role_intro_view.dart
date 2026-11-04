import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/authentication/presentation/pages/employee_sign_up_page.dart';
import 'package:hr_app/features/authentication/presentation/pages/manager_sign_up_page.dart';
import 'package:hr_app/features/authentication/presentation/pages/sign_in_page.dart';

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
                fontWeight: FontWeight.w800,
                color: context.colors.textPrimary,
              ),
            ),
            8.ph,
            Text(
              widget.isManager
                  ? 'منظومة متكاملة لمتابعة الحضور، إدارة المكاتب، والاعتمادات بكل سهولة ودقة.'
                  : 'سجل حضورك اليومي بنقرة واحدة وتابع رصيد إجازاتك وساعات عملك في أي وقت.',
              textAlign: TextAlign.center,
              style: context.typography.body.copyWith(
                color: context.colors.textSecondary,
                height: 1.5,
              ),
            ),
            16.ph,
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 260),
                  child: centerImage,
                ),
              ),
            ),
            16.ph,
            AppButton(
              title: 'تسجيل الدخول',
              onTap: () => NavigationHelper.nextScreenNamed<void>(
                context,
                SignInPage.routeName,
                args: !widget.isManager,
              ),
            ),
            12.ph,
            OutlinedButton(
              onPressed: () => NavigationHelper.nextScreenNamed<void>(
                context,
                widget.isManager
                    ? ManagerSignUpPage.routeName
                    : EmployeeSignUpPage.routeName,
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: BorderSide(
                  color: context.colors.primary.withValues(alpha: 0.6),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'إنشاء حساب جديد',
                style: context.typography.titleMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            8.ph,
          ],
        ),
      ),
    ),
  );
}
