import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/constants/app_images.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/features/intro/user_type_screen.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = '/intro';
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                IntoPage(
                  firstPage: true,
                  image: AppImages.lattendanceIntro,
                  title: 'الحضور و الإنصراف',
                  sub:
                      'تسجيل حضور و انصراف للموظفين داخل نطاق موقع محدد مخصص لكل مكتب',
                ),
                IntoPage(
                  image: AppImages.lemployeeIntro,
                  title: 'الموظفين',
                  sub:
                      'قم بمتابعة الانشطة و طلبات الأجازات للموظفين للحفاظ على كفائة فريق العمل',
                ),
                IntoPage(
                  image: AppImages.lreportsIntro,
                  title: 'بيانات الموظفين',
                  sub:
                      ' مراجعة بيانات الموظفين و طلبات الأجازة و الحضور الشهرى لكل موظف',
                  lastPage: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

class IntoPage extends StatelessWidget {
  const IntoPage({
    required this.image, required this.title, required this.sub, super.key,
    this.lastPage = false,
    this.firstPage = false,
  });
  final String image, title, sub;
  final bool lastPage;
  final bool firstPage;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const Spacer(),
          LottieBuilder.asset(image, height: 300.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: Colors.white70),
          ),
          const Spacer(),
          if (firstPage)
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    AppImages.lSlideUp,
                    height: 36.r,
                    width: 36.r,
                  ),
                  8.pw,
                  Text(
                    'اسحب للأعلى',
                    style: context.typography.titleMedium.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          if (lastPage)
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: AppButton(
                title: 'ابدأ الآن',
                onTap: () {
                  unawaited(
                    NavigationHelper.nextScreenNamed<void>(
                      context,
                      UserTypeScreen.routeName,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
}
