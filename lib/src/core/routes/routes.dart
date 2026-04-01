import 'package:flutter/material.dart';
import 'package:hr_app/src/features/authentication/presentation/sign_in/sign_in.dart';
import 'package:hr_app/src/features/authentication/presentation/employee_sign_up/employee_up.dart';
import 'package:hr_app/src/features/authentication/presentation/manager_sign_up/manager_up.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/attendance_screen.dart';
import 'package:hr_app/src/features/intro/intro.dart';
import 'package:hr_app/src/features/intro/employee_intro.dart';
import 'package:hr_app/src/features/intro/manager_intro.dart';
import 'package:hr_app/src/features/intro/user_type.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_form.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/leaves_screen.dart';
import 'package:hr_app/src/features/manager/departments/presentation/departments_screen.dart';
import 'package:hr_app/src/features/manager/employees/presentation/employees_screen.dart';
import 'package:hr_app/src/features/manager/leaves/presentation/manager_leaves_screen.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/manager_attendance_screen.dart';
import 'package:hr_app/src/features/manager/offices/presentation/offices_screen.dart';
import 'package:hr_app/src/routing_screen.dart';

class AppRoutes {
  static const Map<String, Widget> routes = {
    IntroScreen.routeName: IntroScreen(),
    UserTypeScreen.routeName: UserTypeScreen(),
    EmployeeIntro.routeName: EmployeeIntro(),
    ManagerIntroScreen.routeName: ManagerIntroScreen(),
    SignInScreen.routeName: SignInScreen(),
    ManagerSignUpScreen.routeName: ManagerSignUpScreen(),
    EmployeeSignUpScreen.routeName: EmployeeSignUpScreen(),
    AttendanceScreen.routeName: AttendanceScreen(),
    LeavesScreen.routeName: LeavesScreen(),
    LeaveForm.routeName: LeaveForm(),
    OfficesScreen.routeName: OfficesScreen(),
    EmployeesScreen.routeName: EmployeesScreen(),
    RoutingScreen.routeName: RoutingScreen(),
    DepartmentsScreen.routeName: DepartmentsScreen(),
    ManagerAttendanceScreen.routeName: ManagerAttendanceScreen(),
    ManagerLeavesScreen.routeName: ManagerLeavesScreen()
  };
}
