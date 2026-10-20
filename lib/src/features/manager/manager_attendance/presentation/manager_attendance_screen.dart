import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_picker_sheet.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/components/monthly_signatures_calendar.dart';
import 'package:shimmer/shimmer.dart';

class ManagerAttendanceScreen extends StatefulWidget {
  static const routeName = '/manager-attendance';

  const ManagerAttendanceScreen({super.key});

  @override
  State<ManagerAttendanceScreen> createState() =>
      _ManagerAttendanceScreenState();
}

class _ManagerAttendanceScreenState extends State<ManagerAttendanceScreen> {
  int? _selectedId;
  final DateTime _signatureMonth = DateTime.now();
  late final ManagerAttendanceBloc _attendanceBloc;

  @override
  void initState() {
    super.initState();
    _attendanceBloc = sl<ManagerAttendanceBloc>();
  }

  @override
  void dispose() {
    unawaited(_attendanceBloc.close());
    super.dispose();
  }

  void _onEmployeeSelected(EmployeeDataEntity? emp) {
    if (emp != null && emp.id != _selectedId) {
      setState(() {
        _selectedId = emp.id;
      });
      _attendanceBloc.add(
        LoadManagerAttendanceEvent(
          ManagerAttendanceParams(
            date: _signatureMonth,
            employeeId: _selectedId.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _attendanceBloc),
        BlocProvider(
          create: (context) =>
              sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
        ),
      ],
      child: Builder(
        builder: (screenCtx) => Scaffold(
          appBar: AppBar(
            title: const Text('حضور الموظفين الشهري'),
            leading: const AppBackButton(),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(58.h),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
                child: _EmployeeSelectorBar(
                  selectedId: _selectedId,
                  onSelected: _onEmployeeSelected,
                ),
              ),
            ),
          ),
          body: RefreshIndicator(
            color: screenCtx.colors.primary,
            backgroundColor: screenCtx.colors.surface,
            onRefresh: () async {
              screenCtx.read<EmployeesBloc>().add(const GetEmployeesEvent());
              if (_selectedId != null) {
                _attendanceBloc.add(
                  LoadManagerAttendanceEvent(
                    ManagerAttendanceParams(
                      date: _signatureMonth,
                      employeeId: _selectedId.toString(),
                    ),
                  ),
                );
              }
            },
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: ManagerMonthlySignaturesCalendar(
                    employeeId: _selectedId,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
}

class _EmployeeSelectorBar extends StatelessWidget {
  final int? selectedId;
  final ValueChanged<EmployeeDataEntity?> onSelected;

  const _EmployeeSelectorBar({
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocSelector<
      EmployeesBloc,
      EmployeesState,
      ({bool isLoading, List<EmployeeDataEntity> employees})
    >(
      selector: (state) {
        if (state is EmployeesLoadedState) {
          return (isLoading: false, employees: state.employees.data ?? []);
        }
        return (
          isLoading: state is EmployeesLoadingState,
          employees: const <EmployeeDataEntity>[],
        );
      },
      builder: (context, data) {
        if (data.isLoading) {
          return Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: colors.secondary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: colors.primary,
                child: const Text('جاري تحميل الموظفين...'),
              ),
            ),
          );
        }

        final employeesList = data.employees;
        final selectedEmp = selectedId != null
            ? employeesList.firstWhere(
                (e) => e.id == selectedId,
                orElse: () => const EmployeeDataEntity(),
              )
            : null;

        return InkWell(
          onTap: () {
            unawaited(
              EmployeePickerSheet.show(
                context: context,
                employees: employeesList,
                selectedId: selectedId,
                showAllOption: false,
                onSelected: onSelected,
              ),
            );
          },
          borderRadius: BorderRadius.circular(14.r),
          child: Container(
            height: 46.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: selectedId != null
                    ? colors.primary
                    : colors.primary.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.person_rounded, color: colors.primary, size: 20.r),
                10.pw,
                Expanded(
                  child: Text(
                    selectedEmp?.name ?? 'اختر الموظف لعرض الحضور',
                    style: TextStyle(
                      color: selectedId != null
                          ? colors.primary
                          : Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colors.primary,
                    size: 18.r,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
