import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';

/// Compact employee identity badge showing avatar, name, department, and office.
class EmployeeProfileMiniCard extends StatelessWidget {
  final EmployeeDataEntity employee;

  const EmployeeProfileMiniCard({required this.employee, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.secondary.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: colors.primary.withValues(alpha: 0.6),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: employee.image.toValidImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: employee.image.toValidImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ColoredBox(
                        color: colors.secondary,
                        child: Center(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colors.primary,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, _, _) => Icon(
                        Icons.person_rounded,
                        color: colors.primary,
                        size: 28,
                      ),
                    )
                  : Icon(Icons.person_rounded, color: colors.primary, size: 28),
            ),
          ),
          12.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name ?? 'بدون اسم',
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                4.ph,
                if (employee.department?.name != null)
                  _buildEmployeeMetaRow(
                    'القسم: ',
                    employee.department!.name!,
                    colors,
                  ),
                if (employee.job?.title != null)
                  _buildEmployeeMetaRow(
                    'الوظيفة: ',
                    employee.job!.title!,
                    colors,
                  ),
                if (employee.office?.name != null)
                  _buildEmployeeMetaRow(
                    'المكتب: ',
                    employee.office!.name!,
                    colors,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeMetaRow(String label, String value, AppColors colors) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: colors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
