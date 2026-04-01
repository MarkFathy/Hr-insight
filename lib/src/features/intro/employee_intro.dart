import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/employee_up.dart';

class EmployeeIntro extends StatefulWidget {
  static const routeName = '/employee-intro';
  const EmployeeIntro({super.key});

  @override
  State<EmployeeIntro> createState() => _EmployeeIntroState();
}

class _EmployeeIntroState extends State<EmployeeIntro> {
  late Image centerImage;
  @override
  void initState() {
    super.initState();

    centerImage = Image.asset(
      AppImages.employeeIntroCenter,
      fit: BoxFit.cover,
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
      body: Padding(
        // intro2GWN (1:13)
        padding: EdgeInsets.fromLTRB(13.r, 53.r, 12.r, 76.r),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            Container(
              // foQ (1:14)
              margin: EdgeInsets.fromLTRB(0.r, 20.r, 0.r, 8.r),
              child: const SText('موظف'),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                child: centerImage,
              ),
            ),
            SButton(
                title: 'تسجيل الدخول',
                onTap: () => NV.nextScreenNamed(context, SignInScreen.routeName,
                    args: true)),
            SButton(
              title: 'إنشاء حساب',
              onTap: () =>
                  NV.nextScreenNamed(context, EmployeeSignUpScreen.routeName),
              outlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
