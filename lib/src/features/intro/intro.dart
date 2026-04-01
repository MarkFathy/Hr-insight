import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = '/intro';
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ));
  }
}

class IntoPage extends StatelessWidget {
  final String image;
  final String title;
  final String sub;
  final bool repeat;
  final bool firstPage;
  final bool lastPage;

  const IntoPage(
      {super.key,
      required this.image,
      required this.title,
      this.firstPage = false,
      this.lastPage = false,
      required this.sub,
      this.repeat = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Material(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          child: LottieBuilder.asset(
            image,
            repeat: repeat,
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.primaryColor, fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  sub,
                  style: theme.textTheme.titleMedium!.copyWith(color:Colors.white ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        if (firstPage)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LottieBuilder.asset(
                  AppImages.lSlideUp,
                ),
              ),
              Text(
                'اسحب للأعلى',
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColor),
              ),
            ],
          ),
        if (lastPage)
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: SButton(
              title: 'إنهاء',
              onTap: () => NV.nextScreenCloseOthersNamed(context, '/user-type'),
            ),
          )
      ],
    );
  }
}
