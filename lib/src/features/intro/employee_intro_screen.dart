import 'package:flutter/material.dart';
import 'package:hr_app/src/features/intro/role_intro_view.dart';

class EmployeeIntroScreen extends StatelessWidget {
  static const routeName = '/employee-intro';
  const EmployeeIntroScreen({super.key});

  @override
  Widget build(BuildContext context) => const RoleIntroView(isManager: false);
}
