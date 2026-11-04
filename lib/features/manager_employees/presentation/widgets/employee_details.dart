import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_bloc.dart';
import 'package:hr_app/features/manager_attendance/presentation/widgets/monthly_signatures_calendar.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/set_employee_dialog.dart';
import 'package:intl/intl.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final EmployeeDataEntity employee;
  final VoidCallback rebuild;

  static final DateFormat _joinedDateFormat = DateFormat.yMMMMd('ar');

  const EmployeeDetailsScreen({
    required this.rebuild,
    required this.employee,
    super.key,
  });

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen>
    with AutoConnectivityRestoreMixin {
  late final ManagerAttendanceBloc _attendanceBloc;

  @override
  void initState() {
    super.initState();
    _attendanceBloc = sl<ManagerAttendanceBloc>();
    if (widget.employee.id != null) {
      _attendanceBloc.add(
        LoadManagerAttendanceEvent(
          ManagerAttendanceParams(
            employeeId: widget.employee.id.toString(),
            date: DateTime.now(),
          ),
        ),
      );
    }
  }

  @override
  void onConnectivityRestored() {
    widget.rebuild();
    if (widget.employee.id != null) {
      _attendanceBloc.add(
        LoadManagerAttendanceEvent(
          ManagerAttendanceParams(
            employeeId: widget.employee.id.toString(),
            date: DateTime.now(),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    unawaited(_attendanceBloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employee = widget.employee;
    final validImageUrl = employee.image.toValidImageUrl;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(employee.name ?? 'تفاصيل الموظف'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (ctx) => SetEmployeeDialog(
                  rebuild: () {
                    widget.rebuild();
                    Navigator.pop(context);
                  },
                  employee: employee,
                ),
              );
            },
            child: Text(
              'تعديل',
              style: TextStyle(
                color: context.colors.primary,
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
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: context.colors.surface,
                      borderRadius: context.radius.smBorder,
                      border: Border.all(
                        color: context.colors.primary,
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
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 55,
                                color: context.colors.primary.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 55,
                              color: context.colors.primary.withValues(
                                alpha: 0.5,
                              ),
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
                      ? EmployeeDetailsScreen._joinedDateFormat.format(
                          DateTime.parse(employee.createdAt!),
                        )
                      : 'غير محدد',
                ),
                10.ph,
                // Attendance section
                Expanded(
                  child: BlocProvider.value(
                    value: _attendanceBloc,
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
  const InfoCard({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
    child: Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.typography.labelLarge.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.pw,
            Flexible(
              child: Text(
                value != null && value!.isNotEmpty ? value! : 'فارغ',
                style: context.typography.labelMedium.copyWith(
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
