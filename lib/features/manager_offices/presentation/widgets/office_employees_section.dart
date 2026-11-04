import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_error_state.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/employee_card.dart';

/// Renders the section listing employees currently assigned to a specific office.
class OfficeEmployeesSection extends StatelessWidget {
  final List<EmployeeDataEntity> employees;
  final int count;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;

  const OfficeEmployeesSection({
    required this.employees,
    required this.count,
    required this.isLoading,
    required this.onRetry,
    this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      16.ph,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.groups_rounded, size: 20, color: context.colors.primary),
            8.pw,
            Text(
              'الموظفون التابعون لهذا الفرع',
              style: context.typography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      8.ph,
      if (isLoading)
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(child: EmployeeIndicator()),
              SizedBox(width: 10),
              Expanded(child: EmployeeIndicator()),
            ],
          ),
        )
      else if (errorMessage != null)
        AppErrorState(message: errorMessage!, onRetry: onRetry)
      else if (employees.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.person_off_outlined,
                  size: 38,
                  color: Colors.white.withValues(alpha: 0.4),
                ),
                8.ph,
                Text(
                  'لا يوجد موظفون معينون في هذا المكتب حتى الآن',
                  style: context.typography.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        )
      else
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.05,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: employees.length,
            itemBuilder: (context, index) =>
                EmployeeCard(employee: employees[index], inOffice: true),
          ),
        ),
    ],
  );
}
