import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/intro/presentation/widgets/role_intro_view.dart';

class ManagerIntroPage extends StatefulWidget {
  static const routeName = '/manager-inro';
  const ManagerIntroPage({super.key});

  @override
  State<ManagerIntroPage> createState() => _ManagerIntroPageState();
}

class _ManagerIntroPageState extends State<ManagerIntroPage>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: true);
}

typedef ManagerIntroScreen = ManagerIntroPage;
