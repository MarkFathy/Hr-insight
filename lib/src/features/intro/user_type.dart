import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/intro/employee_intro.dart';
import 'package:hr_app/src/features/intro/manager_intro.dart';

class UserTypeScreen extends StatelessWidget {
  static const routeName = '/user-type';
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child:
                    SText('سجل كـ', color: theme.primaryColor, fontSize: 30.r)),
            20.ph,
            SButton(
              title: 'مسؤول',
              onTap: () =>
                  NV.nextScreenNamed(context, ManagerIntroScreen.routeName),
            ),
            SButton(
                title: "موظف",
                onTap: () =>
                    NV.nextScreenNamed(context, EmployeeIntro.routeName),
                outlined: true),
          ],
        ),
      ),
    );
  }
}
