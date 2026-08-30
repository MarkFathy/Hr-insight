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

  const EmployeeDetailsScreen({
    super.key,
    required this.rebuild,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final validImageUrl = employee.image.toValidImageUrl;

    return Scaffold(
      appBar: AppBar(
        leading: const SBackButton(),
        title: Text(employee.name ?? 'تفاصيل الموظف'),
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
            child: Text(
              'تعديل',
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          5.ph,
          // Top Header: Photo + Main Work Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'User-Profile-${employee.id}',
                  child: Container(
                    width: 110.r,
                    height: 110.r,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.primaryColor,
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: validImageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: validImageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                  width: 22.r,
                                  height: 22.r,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 55.r,
                                color: theme.primaryColor.withValues(alpha: 0.5),
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 55.r,
                              color: theme.primaryColor.withValues(alpha: 0.5),
                            ),
                    ),
                  ),
                ),
                10.pw,
                Expanded(
                  child: Column(
                    children: [
                      InfoCard(
                        title: 'المكتب',
                        value: employee.office == null
                            ? 'لم يتم تعيين مكتب'
                            : employee.office!.name,
                      ),
                      InfoCard(
                        title: 'القسم',
                        value: employee.department == null
                            ? 'لم يتم تعيين قسم'
                            : employee.department!.name,
                      ),
                      InfoCard(
                        title: 'المسمى الوظيفى',
                        value: employee.job == null
                            ? 'لم يتم تعيين وظيفة'
                            : employee.job!.title,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          5.ph,
          // Contact & General Info Rows
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(title: 'البريد', value: employee.email),
                InfoCard(title: 'الهاتف', value: employee.phone),
                InfoCard(title: 'العنوان', value: employee.address),
                InfoCard(
                  title: 'تاريخ الإنضمام',
                  value: employee.createdAt != null
                      ? DateFormat.yMMMMd('ar').format(DateTime.parse(employee.createdAt!))
                      : 'غير محدد',
                ),
                10.ph,
                // Attendance section
                Expanded(
                  child: BlocProvider(
                    create: (context) => sl<ManagerAttendanceBloc>(),
                    child: ManagerMonthlySignaturesCalendar(
                      employeeId: employee.id,
                    ),
                  ),
                ),
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
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Material(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.pw,
              Flexible(
                child: Text(
                  value != null && value!.isNotEmpty ? value! : 'فارغ',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
