import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in.dart';
import 'package:hr_app/src/features/authentication/presentation/manager_sign_up/manager_up.dart';

class ManagerIntroScreen extends StatefulWidget {
  static const routeName = '/manager-inro';
  const ManagerIntroScreen({super.key});

  @override
  State<ManagerIntroScreen> createState() => _ManagerIntroState();
}

class _ManagerIntroState extends State<ManagerIntroScreen> {
  late Image centerImage;
  @override
  void initState() {
    super.initState();

    centerImage = Image.asset(
      AppImages.managerIntroCenter,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(centerImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.ph,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: IconButton(
                    onPressed: () => NV.pop(context),
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
              )
            ],
          ),
          40.ph,
          SText('مسؤول', fontSize: 30.r),
          30.ph,
          SizedBox(
            height: 300.r,
            child: centerImage,
          ),
          50.ph,
          SButton(
              title: 'تسجيل الدخول',
              onTap: () => NV.nextScreenNamed(context, SignInScreen.routeName,
                  args: false)),
          SButton(
            title: 'إنشاء حساب',
            onTap: () =>
                NV.nextScreenNamed(context, ManagerSignUpScreen.routeName),
            outlined: true,
          ),
        ],
      ),
    );
  }
}
