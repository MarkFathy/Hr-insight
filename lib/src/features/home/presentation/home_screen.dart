import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/constants/app_images.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/home/presentation/components/app_title.dart';
import 'package:hr_app/src/features/home/presentation/components/employee_grid.dart';
import 'package:hr_app/src/features/home/presentation/components/manager_grid.dart';
import 'package:hr_app/src/features/home/presentation/components/sign_widget.dart';

class HomeScreen extends StatelessWidget {
  final bool isEmployee;
  static const routeName = '/home';
  const HomeScreen({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) {
    final content = Builder(
      builder: (ctx) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: RefreshIndicator(
            color: ctx.colors.primary,
            backgroundColor: ctx.colors.surface,
            onRefresh: () async {
              if (isEmployee) {
                ctx.read<AttendanceBloc>().add(const GetAttendanceEvent());
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: AppTitle()),
                        12.pw,
                        Padding(
                          padding: EdgeInsets.all(4.r),
                          child: Image.asset(AppImages.logo, height: 76.r),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      color: ctx.colors.primary.withValues(alpha: 0.5),
                      height: 14.h,
                      thickness: 1,
                    ),
                  ),
                  if (!isEmployee) const ManagerGrid(),
                  if (isEmployee) ...[
                    14.ph,
                    const SignWidget(),
                    16.ph,
                    const EmployeeGrid(),
                  ],
                  // Spacing to clear floating navigation bar
                  120.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (isEmployee) {
      return BlocProvider(
        create: (_) => sl<AttendanceBloc>()..add(const GetAttendanceEvent()),
        child: content,
      );
    }

    return content;
  }
}
