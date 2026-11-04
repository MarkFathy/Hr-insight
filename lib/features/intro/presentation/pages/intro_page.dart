import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/intro/presentation/pages/user_type_page.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: const [
              IntroSlideWidget(
                firstPage: true,
                image: AppImages.lattendanceIntro,
                title: 'الحضور و الإنصراف',
                sub:
                    'تسجيل حضور و انصراف للموظفين داخل نطاق موقع محدد مخصص لكل مكتب',
              ),
              IntroSlideWidget(
                image: AppImages.lemployeeIntro,
                title: 'الموظفين',
                sub:
                    'قم بمتابعة الانشطة و طلبات الأجازات للموظفين للحفاظ على كفائة فريق العمل',
              ),
              IntroSlideWidget(
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

class IntroSlideWidget extends StatelessWidget {
  const IntroSlideWidget({
    required this.image,
    required this.title,
    required this.sub,
    super.key,
    this.lastPage = false,
    this.firstPage = false,
  });
  final String image, title, sub;
  final bool lastPage;
  final bool firstPage;

  @override
  Widget build(BuildContext context) => ResponsiveContainer(
    maxWidth: 520,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        const Spacer(),
        Flexible(
          flex: 4,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 280),
            child: LottieBuilder.asset(image),
          ),
        ),
        16.ph,
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.typography.h2.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        12.ph,
        Text(
          sub,
          textAlign: TextAlign.center,
          style: context.typography.body.copyWith(color: Colors.white70),
        ),
        const Spacer(),
        if (firstPage)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(AppImages.lSlideUp, height: 36, width: 36),
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
            padding: const EdgeInsets.only(bottom: 24),
            child: AppButton(
              title: 'ابدأ الآن',
              onTap: () {
                unawaited(
                  NavigationHelper.nextScreenNamed<void>(
                    context,
                    UserTypePage.routeName,
                  ),
                );
              },
            ),
          ),
      ],
    ),
  );
}

typedef IntroScreen = IntroPage;
typedef IntoPage = IntroSlideWidget;
