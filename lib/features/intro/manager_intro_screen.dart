import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/intro/role_intro_view.dart';

class ManagerIntroScreen extends StatefulWidget {
  static const routeName = '/manager-inro';
  const ManagerIntroScreen({super.key});

  @override
  State<ManagerIntroScreen> createState() => _ManagerIntroScreenState();
}

class _ManagerIntroScreenState extends State<ManagerIntroScreen>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: true);
}
