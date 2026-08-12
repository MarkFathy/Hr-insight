import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/set_employee_dialog.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_block.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/components/monthly_signatures_calendar.dart';
import 'package:hr_app/src/injector.dart';
import 'package:intl/intl.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeDataEntity employee;
  final Function() rebuild;

  const EmployeeDetailsScreen(
      {super.key, required this.rebuild, required this.employee});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const SBackButton(),
        title: Text(employee.name!),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (ctx) => SetEmployeeDialog(
                    rebuild: () {
                      rebuild();
                      NV.pop(context);
                    },
                    employee: employee,
                  ),
                );
              },
              child: const Text('تعديل'))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          5.ph,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Hero(
                  tag: 'User-Profile',
                  child: Container(
                    width: 120.r,
                    height: 120.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: theme.primaryColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: employee.image.toValidImageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: employee.image.toValidImageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                  width: 24.r,
                                  height: 24.r,
                                  child: const CircularProgressIndicator(
                                      strokeWidth: 2),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 60.r,
                                color: theme.primaryColor.withValues(alpha: 0.5),
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 60.r,
                              color: theme.primaryColor.withValues(alpha: 0.5),
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InfoCard(
                      title: 'المكتب',
                      value: employee.office == null
                          ? 'لم يتم تعيين مكتب'
                          : employee.office!.name!,
                    ),
                    InfoCard(
                        title: 'القسم',
                        value: employee.department == null
                            ? 'لم يتم تعيين قسم'
                            : employee.department!.name!),
                    InfoCard(
                        title: 'المسمى الوظيفى',
                        value: employee.job == null
                            ? 'لم يتم تعيين وظيفة'
                            : employee.job!.title!),
                  ],
                ),
              )
            ],
          ),
          5.ph,
          // const Divider(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // spacing: 20,
              children: [
                InfoCard(title: 'البريد', value: employee.email),
                InfoCard(title: 'الهاتف', value: employee.phone),
                InfoCard(
                  title: 'العنوان',
                  value: employee.address,
                ),
                InfoCard(
                    title: 'تاريخ الإنضمام',
                    value: DateFormat.yMMMMd('ar')
                        .format(DateTime.parse(employee.createdAt!))),
                10.ph,
                Expanded(
                  child: BlocProvider(
                    create: (context) => sl<ManagerAttendanceBloc>(),
                    child: ManagerMonthlySignaturesCalendar(
                      employeeId: employee.id,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String? value;
  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: theme.colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColor),
              ),
              // 20.pw,
              Text(
                value ?? 'فارغ',
                style: theme.textTheme.labelLarge!.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
