import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/src/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:intl/intl.dart';

class ManagerLeaveDialog extends StatelessWidget {
  final LeavesDataEntity leave;
  final EmployeeDataEntity? employeeDataEntity;
  final BuildContext ctx;

  const ManagerLeaveDialog(
      {super.key,
      required this.leave,
      required this.employeeDataEntity,
      required this.ctx});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      // contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                color: theme.colorScheme.secondary,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(children: [
                        Text(
                          'اسم الموظف : ',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: theme.primaryColor),
                        ),
                        Text(employeeDataEntity!.name!)
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(children: [
                        Text(
                          'المكتب : ',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: theme.primaryColor),
                        ),
                        Text(employeeDataEntity!.office == null
                            ? ''
                            : employeeDataEntity!.office!.name!)
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(children: [
                        Text(
                          'القسم : ',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: theme.primaryColor),
                        ),
                        Text(employeeDataEntity!.department == null
                            ? ''
                            : employeeDataEntity!.department!.name!),
                        30.pw,
                        Text(
                          'الوظيفة : ',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: theme.primaryColor),
                        ),
                        Text(employeeDataEntity!.job == null
                            ? ''
                            : employeeDataEntity!.job!.title!)
                      ]),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Row(children: [

                    //   ]),
                    // ),
                    LeaveInfoCard(
                        title: 'تاريخ الطلب :',
                        value: DateFormat.yMMMMd('ar').format(leave.dayDate!)),
                    LeaveInfoCard(
                        title: 'من :',
                        value: DateFormat('y-M-d الساعة HH:mm')
                            .format(leave.from!)),
                    LeaveInfoCard(
                        title: "الى :",
                        value:
                            DateFormat('y-M-d الساعة HH:mm').format(leave.to!)),
                    LeaveInfoCard(
                        title: 'نوع الإجازة :', value: leave.leaveType!),
                    LeaveInfoCard(
                      title: 'حالة الطلب :',
                      value: leave.status == null
                          ? 'قيد المراجعة'
                          : leave.status == 'approved'
                              ? 'تم القبول'
                              : leave.status == 'rejected'
                                  ? 'تم الرفض'
                                  : 'غير معروف',
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 3,
                  top: 3,
                  child: InkWell(
                      onTap: () => NV.pop(context),
                      child: Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: MyColors.greyColor,
                          ),
                        ),
                      )))
            ],
          ),
          10.ph,
          if (leave.status == 'pending')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      ctx.read<ManagerLeavesBloc>().add(SetLeaveEvent(
                          SetLeaveParams(id: leave.id, status: "approved")));
                      NV.pop(context);
                    },
                    icon: const Icon(
                      Icons.done_outline_rounded,
                      color: Colors.green,
                    ),
                    label: Text(
                      'قبول',
                      style: TextStyle(color: MyColors.greyColor),
                    )),
                ElevatedButton.icon(
                    onPressed: () {
                      ctx.read<ManagerLeavesBloc>().add(SetLeaveEvent(
                          SetLeaveParams(id: leave.id, status: "rejected")));
                      NV.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    label: Text(
                      'رفض',
                      style: TextStyle(color: MyColors.greyColor),
                    )),
              ],
            )
        ],
      ),
    );
  }
}

class LeaveInfoCard extends StatelessWidget {
  final String title;
  final String value;
  const LeaveInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Material(
        color: MyColors.greyColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor)),
              Text(value)
            ],
          ),
        ),
      ),
    );
  }
}
