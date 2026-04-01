import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/features/home/presentation/components/app_title.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/home/presentation/components/employee_grid.dart';
import 'package:hr_app/src/features/home/presentation/components/sign_widget.dart';
import 'package:hr_app/src/features/home/presentation/components/manager_grid.dart';

class HomeScreen extends StatelessWidget {
  final bool isEmployee;
  static const routeName = '/home';
  const HomeScreen({super.key, required this.isEmployee});

  @override
  Widget build(BuildContext context) { 
    // final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(child: AppTitle()),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        AppImages.logo,
                        height: 100.r,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.amberAccent,
              ),
              if (!isEmployee) const ManagerGrid(),
              if (isEmployee) ...[
                10.ph,
                const SignWidget(),
                20.ph,
                const EmployeeGrid(),
              ],
              100.ph,
            ],
          ),
        ),
      ),
    );
  }
}
