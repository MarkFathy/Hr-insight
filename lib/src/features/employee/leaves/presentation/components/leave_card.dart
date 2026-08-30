import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/presentation/components/manager_leave_dialog.dart';
import 'package:intl/intl.dart';

class LeaveCard extends StatelessWidget {
  final LeavesDataEntity leave;
  final EmployeeDataEntity? employeeDataEntity;

  const LeaveCard({super.key, required this.leave, this.employeeDataEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: employeeDataEntity == null
            ? null
            : () => showDialog(
                  context: context,
                  builder: (ctx) => ManagerLeaveDialog(
                    leave: leave,
                    employeeDataEntity: employeeDataEntity,
                    ctx: context,
                  ),
                ),
        child: Material(
          color: theme.colorScheme.secondary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: theme.primaryColor.withValues(alpha: 0.25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Header: Employee Name + Department & Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (employeeDataEntity != null)
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              size: 16.r,
                              color: theme.primaryColor,
                            ),
                            6.pw,
                            Flexible(
                              child: Text(
                                employeeDataEntity!.name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.r,
                                  color: theme.primaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (employeeDataEntity!.department?.name != null) ...[
                              Text(
                                ' • القسم: ',
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 12.r,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  employeeDataEntity!.department!.name!,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 12.r,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ],
                        ),
                      )
                    else
                      Text(
                        'نوع الإجازة: ${leave.leaveType ?? ''}',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.r,
                        ),
                      ),
                    _buildStatusText(leave.status),
                  ],
                ),

                const Divider(height: 14),

                // Middle Info: Dates & Type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'تاريخ الطلب: ',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 11.r,
                              ),
                            ),
                            Text(
                              leave.dayDate != null
                                  ? DateFormat.yMMMMd('ar').format(leave.dayDate!)
                                  : '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.r,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        4.ph,
                        Row(
                          children: [
                            Text(
                              'من: ',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 11.r,
                              ),
                            ),
                            Text(
                              leave.from != null
                                  ? DateFormat.yMMMd('ar').format(leave.from!)
                                  : '',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 11.r,
                              ),
                            ),
                          ],
                        ),
                        4.ph,
                        Row(
                          children: [
                            Text(
                              'إلى: ',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 11.r,
                              ),
                            ),
                            Text(
                              leave.to != null
                                  ? DateFormat.yMMMd('ar').format(leave.to!)
                                  : '',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 11.r,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (employeeDataEntity != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'نوع الإجازة',
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 11.r,
                            ),
                          ),
                          4.ph,
                          Text(
                            leave.leaveType ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusText(String? status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case 'approved':
        color = Colors.green;
        text = 'تم القبول';
        icon = Icons.check_circle_outline_rounded;
        break;
      case 'rejected':
        color = Colors.red;
        text = 'تم الرفض';
        icon = Icons.cancel_outlined;
        break;
      default:
        color = Colors.orange;
        text = 'قيد المراجعة';
        icon = Icons.hourglass_empty_rounded;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.r, color: color),
        4.pw,
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 11.r,
          ),
        ),
      ],
    );
  }
}
