import 'package:flutter/material.dart';
import 'package:hr_app/features/authentication/presentation/employee_sign_up/employee_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/manager_sign_up/manager_sign_up_screen.dart';
import 'package:hr_app/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:hr_app/features/employee/attendance/presentation/attendance_screen.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/leave_form.dart';
import 'package:hr_app/features/employee/leaves/presentation/leaves_screen.dart';
import 'package:hr_app/features/home/splash_screen.dart';
import 'package:hr_app/features/intro/employee_intro_screen.dart';
import 'package:hr_app/features/intro/intro_screen.dart';
import 'package:hr_app/features/intro/manager_intro_screen.dart';
import 'package:hr_app/features/intro/user_type_screen.dart';
import 'package:hr_app/features/manager/departments/presentation/departments_screen.dart';
import 'package:hr_app/features/manager/employees/presentation/employees_screen.dart';
import 'package:hr_app/features/manager/leaves/presentation/manager_leaves_screen.dart';
import 'package:hr_app/features/manager/manager_attendance/presentation/manager_attendance_screen.dart';
import 'package:hr_app/features/manager/offices/presentation/offices_screen.dart';
import 'package:hr_app/routing_screen.dart';

class AppRoutes {
  static Widget buildScreen(String? routeName) => switch (routeName) {
    IntroScreen.routeName => const IntroScreen(),
    UserTypeScreen.routeName => const UserTypeScreen(),
    EmployeeIntroScreen.routeName => const EmployeeIntroScreen(),
    ManagerIntroScreen.routeName => const ManagerIntroScreen(),
    SignInScreen.routeName => const SignInScreen(),
    ManagerSignUpScreen.routeName => const ManagerSignUpScreen(),
    EmployeeSignUpScreen.routeName => const EmployeeSignUpScreen(),
    AttendanceScreen.routeName => const AttendanceScreen(),
    LeavesScreen.routeName => const LeavesScreen(),
    LeaveForm.routeName => const LeaveForm(),
    OfficesScreen.routeName => const OfficesScreen(),
    EmployeesScreen.routeName => const EmployeesScreen(),
    RoutingScreen.routeName => const RoutingScreen(),
    DepartmentsScreen.routeName => const DepartmentsScreen(),
    ManagerAttendanceScreen.routeName => const ManagerAttendanceScreen(),
    ManagerLeavesScreen.routeName => const ManagerLeavesScreen(),
    _ => const SplashScreen(),
  };
}
