import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_bloc.dart';
import 'package:hr_app/features/manager_leaves/presentation/widgets/manager_leave_dialog.dart';
import 'package:intl/intl.dart';

class LeaveCard extends StatelessWidget {
  final LeavesDataEntity leave;
  final EmployeeDataEntity? employeeDataEntity;

  static final DateFormat _fullDateFormat = DateFormat.yMMMMd('ar');
  static final DateFormat _shortDateFormat = DateFormat.yMMMd('ar');

  const LeaveCard({required this.leave, super.key, this.employeeDataEntity});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colors.primary.withValues(alpha: 0.18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: employeeDataEntity == null
              ? null
              : () => showDialog<void>(
                  context: context,
                  builder: (ctx) => ManagerLeaveDialog(
                    leave: leave,
                    employeeDataEntity: employeeDataEntity,
                    ctx: context,
                  ),
                ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Row: Type / Employee & Status Chip
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (employeeDataEntity != null)
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: context.colors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person_rounded,
                                size: 16,
                                color: context.colors.primary,
                              ),
                            ),
                            8.pw,
                            Flexible(
                              child: Text(
                                employeeDataEntity!.name ?? '',
                                style: context.typography.titleSmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (employeeDataEntity!.department?.name !=
                                null) ...[
                              Text(
                                ' • ',
                                style: TextStyle(
                                  color: context.colors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  employeeDataEntity!.department!.name!,
                                  style: TextStyle(
                                    color: context.colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ],
                        ),
                      )
                    else
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: context.colors.primary.withValues(
                                alpha: 0.15,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.beach_access_rounded,
                              size: 16,
                              color: context.colors.primary,
                            ),
                          ),
                          8.pw,
                          Text(
                            LeaveType.toArabic(leave.leaveType),
                            style: context.typography.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    _buildStatusBadge(context, leave.status),
                  ],
                ),
                12.ph,
                // Duration strip container
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            size: 16,
                            color: context.colors.primary,
                          ),
                          8.pw,
                          Text(
                            'الفترة: ',
                            style: context.typography.caption.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          Text(
                            '${leave.from != null ? _shortDateFormat.format(leave.from!) : ''} - ${leave.to != null ? _shortDateFormat.format(leave.to!) : ''}',
                            style: context.typography.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (leave.dayDate != null)
                        Text(
                          _fullDateFormat.format(leave.dayDate!),
                          style: context.typography.caption.copyWith(
                            color: context.colors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _buildStatusBadge(BuildContext context, String? status) {
    final (Color color, String text, IconData icon) = switch (status) {
      'approved' => (
        context.colors.success,
        'تم القبول',
        Icons.check_circle_rounded,
      ),
      'rejected' => (context.colors.error, 'تم الرفض', Icons.cancel_rounded),
      _ => (
        context.colors.warning,
        'قيد المراجعة',
        Icons.hourglass_empty_rounded,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          4.pw,
          Text(
            text,
            style: context.typography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
