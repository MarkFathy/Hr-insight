import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/intro/role_intro_view.dart';

class EmployeeIntroScreen extends StatefulWidget {
  static const routeName = '/employee-intro';
  const EmployeeIntroScreen({super.key});

  @override
  State<EmployeeIntroScreen> createState() => _EmployeeIntroScreenState();
}

class _EmployeeIntroScreenState extends State<EmployeeIntroScreen>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: false);
}
