import 'package:flutter/material.dart';
import 'package:hr_app/src/features/intro/role_intro_view.dart';

class ManagerIntroScreen extends StatelessWidget {
  static const routeName = '/manager-inro';
  const ManagerIntroScreen({super.key});

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: true);
}
