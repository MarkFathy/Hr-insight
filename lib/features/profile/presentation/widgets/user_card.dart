import 'package:flutter/material.dart';
import 'package:hr_app/features/profile/presentation/widgets/user_details_card.dart';
import 'package:hr_app/features/profile/presentation/widgets/user_header_card.dart';

/// Coordinator widget assembling the profile header card and details card.
class UserCard extends StatelessWidget {
  final bool isEmployee;

  const UserCard({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      UserHeaderCard(isEmployee: isEmployee),
      UserDetailsCard(isEmployee: isEmployee),
    ],
  );
}
