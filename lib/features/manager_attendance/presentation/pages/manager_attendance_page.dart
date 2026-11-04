import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/shared/widgets/app_error_state.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_bloc.dart';
import 'package:hr_app/features/manager_attendance/presentation/widgets/monthly_signatures_calendar.dart';
import 'package:hr_app/features/manager_employees/presentation/bloc/employees_bloc.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/employee_picker_sheet.dart';
import 'package:shimmer/shimmer.dart';

class ManagerAttendancePage extends StatefulWidget {
  static const routeName = '/manager-attendance';

  const ManagerAttendancePage({super.key});

  @override
  State<ManagerAttendancePage> createState() => _ManagerAttendancePageState();
}

class _ManagerAttendancePageState extends State<ManagerAttendancePage>
    with AutoConnectivityRestoreMixin {
  int? _selectedId;
  final DateTime _signatureMonth = DateTime.now();
  late final ManagerAttendanceBloc _attendanceBloc;
  late final EmployeesBloc _employeesBloc;

  @override
  void initState() {
    super.initState();
    _attendanceBloc = sl<ManagerAttendanceBloc>();
    _employeesBloc = sl<EmployeesBloc>()..add(const GetEmployeesEvent());
  }

  @override
  void onConnectivityRestored() {
    _employeesBloc.add(const GetEmployeesEvent());
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
  }

  @override
  void dispose() {
    unawaited(_attendanceBloc.close());
    unawaited(_employeesBloc.close());
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
      BlocProvider.value(value: _employeesBloc),
    ],
    child: Builder(
      builder: (screenCtx) => Scaffold(
        appBar: AppBar(
          title: const Text('حضور الموظفين الشهري'),
          leading: const AppBackButton(),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'تحديث البيانات',
              onPressed: () {
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
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(58),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: _EmployeeSelectorBar(
                selectedId: _selectedId,
                onSelected: _onEmployeeSelected,
              ),
            ),
          ),
        ),
        body: BlocBuilder<EmployeesBloc, EmployeesState>(
          builder: (context, empState) {
            if (_selectedId == null && empState is EmployeesErrorState) {
              return RefreshIndicator(
                color: screenCtx.colors.primary,
                backgroundColor: screenCtx.colors.surface,
                onRefresh: () async {
                  screenCtx.read<EmployeesBloc>().add(
                    const GetEmployeesEvent(),
                  );
                },
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: AppErrorState(
                        message: empState.message,
                        onRetry: () => screenCtx.read<EmployeesBloc>().add(
                          const GetEmployeesEvent(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return ManagerMonthlySignaturesCalendar(employeeId: _selectedId);
          },
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
          return (
            isLoading: false,
            employees: state.employees.data ?? const <EmployeeDataEntity>[],
          );
        }
        return (
          isLoading: state is EmployeesLoadingState,
          employees: const <EmployeeDataEntity>[],
        );
      },
      builder: (context, data) {
        if (data.isLoading) {
          return Container(
            height: 44,
            decoration: BoxDecoration(
              color: colors.secondary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(14),
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
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selectedId != null
                    ? colors.primary
                    : colors.primary.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.person_rounded, color: colors.primary, size: 20),
                10.pw,
                Expanded(
                  child: Text(
                    selectedEmp?.name ?? 'اختر الموظف لعرض الحضور',
                    style: TextStyle(
                      color: selectedId != null
                          ? colors.primary
                          : Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colors.primary,
                    size: 18,
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

typedef ManagerAttendanceScreen = ManagerAttendancePage;
