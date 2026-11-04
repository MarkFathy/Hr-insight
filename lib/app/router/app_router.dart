import 'package:flutter/material.dart';
import 'package:hr_app/app/router/routing_page.dart';
import 'package:hr_app/features/authentication/presentation/pages/employee_sign_up_page.dart';
import 'package:hr_app/features/authentication/presentation/pages/manager_sign_up_page.dart';
import 'package:hr_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:hr_app/features/employee_attendance/presentation/pages/attendance_page.dart';
import 'package:hr_app/features/employee_leaves/presentation/pages/leaves_page.dart';
import 'package:hr_app/features/employee_leaves/presentation/widgets/leave_form.dart';
import 'package:hr_app/features/home/presentation/pages/splash_page.dart';
import 'package:hr_app/features/intro/presentation/pages/employee_intro_page.dart';
import 'package:hr_app/features/intro/presentation/pages/intro_page.dart';
import 'package:hr_app/features/intro/presentation/pages/manager_intro_page.dart';
import 'package:hr_app/features/intro/presentation/pages/user_type_page.dart';
import 'package:hr_app/features/manager_attendance/presentation/pages/manager_attendance_page.dart';
import 'package:hr_app/features/manager_departments/presentation/pages/departments_page.dart';
import 'package:hr_app/features/manager_employees/presentation/pages/employees_page.dart';
import 'package:hr_app/features/manager_leaves/presentation/pages/manager_leaves_page.dart';
import 'package:hr_app/features/manager_offices/presentation/pages/offices_page.dart';

class AppRouter {
  static Widget buildPage(String? routeName) => switch (routeName) {
    IntroPage.routeName => const IntroPage(),
    UserTypePage.routeName => const UserTypePage(),
    EmployeeIntroPage.routeName => const EmployeeIntroPage(),
    ManagerIntroPage.routeName => const ManagerIntroPage(),
    SignInPage.routeName => const SignInPage(),
    ManagerSignUpPage.routeName => const ManagerSignUpPage(),
    EmployeeSignUpPage.routeName => const EmployeeSignUpPage(),
    AttendancePage.routeName => const AttendancePage(),
    LeavesPage.routeName => const LeavesPage(),
    LeaveForm.routeName => const LeaveForm(),
    OfficesPage.routeName => const OfficesPage(),
    EmployeesPage.routeName => const EmployeesPage(),
    RoutingPage.routeName => const RoutingPage(),
    DepartmentsPage.routeName => const DepartmentsPage(),
    ManagerAttendancePage.routeName => const ManagerAttendancePage(),
    ManagerLeavesPage.routeName => const ManagerLeavesPage(),
    _ => const SplashPage(),
  };

  static Widget buildScreen(String? routeName) => buildPage(routeName);
}

typedef AppRoutes = AppRouter;
