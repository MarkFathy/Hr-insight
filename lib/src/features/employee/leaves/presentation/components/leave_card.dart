import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
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
            borderOnForeground: true,
            color: theme.colorScheme.secondary,
            elevation: 6,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('تاريخ الطلب',
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: theme.colorScheme.primary)),
                          10.pw,
                          Text(
                            DateFormat.yMMMMd('ar').format(leave.dayDate!),
                            style: theme.textTheme.labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('من',
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: theme.colorScheme.primary)),
                          10.pw,
                          Text(
                            DateFormat.yMMMEd('ar').format(leave.from!),
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'إلى',
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: theme.colorScheme.primary),
                          ),
                          10.pw,
                          Text(
                            DateFormat.yMMMEd('ar').format(leave.to!),
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        // Handling status as a string
                        child: leave.status == null
                            ? const Row(
                                children: [
                                  Icon(
                                    Icons.pending_actions_rounded,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text('قيد المراجعة'),
                                  )
                                ],
                              )
                            : leave.status == "approved"
                                ? const Row(
                                    children: [
                                      Icon(
                                        Icons.done_outline_rounded,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text('تم القبول'),
                                      )
                                    ],
                                  )
                                : leave.status == "rejected"
                                    ? const Row(
                                        children: [
                                          Icon(
                                            Icons.close,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Text('تم الرفض'),
                                          )
                                        ],
                                      )
                                    : const Row(
                                        children: [
                                          Icon(
                                            Icons.pending_actions_rounded,
                                            size: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Text('قيد المراجعة'),
                                          )
                                        ],
                                      ),
                      ),
                      Text('نوع الإجازة : ${leave.leaveType!.toUpperCase()}',
                          style: theme.textTheme.labelMedium!),
                      if (employeeDataEntity != null)
                        Text(
                          'الموظف : ${employeeDataEntity!.name}',
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium,
                        ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
