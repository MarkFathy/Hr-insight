import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/intro/presentation/widgets/role_intro_view.dart';

class EmployeeIntroPage extends StatefulWidget {
  static const routeName = '/employee-intro';
  const EmployeeIntroPage({super.key});

  @override
  State<EmployeeIntroPage> createState() => _EmployeeIntroPageState();
}

class _EmployeeIntroPageState extends State<EmployeeIntroPage>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: false);
}

typedef EmployeeIntroScreen = EmployeeIntroPage;
