import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_empty_state.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/card_indicator.dart';
import 'package:hr_app/features/employee/leaves/presentation/components/leave_card.dart';
import 'package:hr_app/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/employees/presentation/components/employee_picker_sheet.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';

class ManagerLeavesScreen extends StatefulWidget {
  static const routeName = '/manager-leaves';
  const ManagerLeavesScreen({super.key});

  @override
  State<ManagerLeavesScreen> createState() => _ManagerLeavesScreenState();
}

class _ManagerLeavesScreenState extends State<ManagerLeavesScreen>
    with AutoConnectivityRestoreMixin {
  int? _selectedId;
  late final ManagerLeavesBloc _leavesBloc;
  late final EmployeesBloc _employeesBloc;

  @override
  void initState() {
    super.initState();
    _leavesBloc = sl<ManagerLeavesBloc>()..add(const GetManagerLeavesEvent());
    _employeesBloc = sl<EmployeesBloc>()..add(const GetEmployeesEvent());
  }

  @override
  void onConnectivityRestored() {
    _leavesBloc.add(const GetManagerLeavesEvent());
    _employeesBloc.add(const GetEmployeesEvent());
  }

  @override
  void dispose() {
    unawaited(_leavesBloc.close());
    unawaited(_employeesBloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider.value(value: _leavesBloc),
      BlocProvider.value(value: _employeesBloc),
    ],
    child: Builder(
      builder: (screenCtx) => Scaffold(
        appBar: AppBar(
          title: const Text('طلبات الإنصراف والإجازات'),
          leading: const AppBackButton(),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: _ManagerLeavesEmployeePicker(
                selectedId: _selectedId,
                onSelected: (emp) {
                  setState(() {
                    _selectedId = emp?.id;
                  });
                },
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          color: screenCtx.colors.primary,
          backgroundColor: screenCtx.colors.surface,
          onRefresh: () async {
            screenCtx.read<ManagerLeavesBloc>().add(
              const GetManagerLeavesEvent(),
            );
            screenCtx.read<EmployeesBloc>().add(const GetEmployeesEvent());
          },
          child: _LeavesListBody(selectedId: _selectedId),
        ),
      ),
    ),
  );
}

class _ManagerLeavesEmployeePicker extends StatelessWidget {
  final int? selectedId;
  final ValueChanged<EmployeeDataEntity?> onSelected;

  const _ManagerLeavesEmployeePicker({
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
                Icon(
                  selectedId != null
                      ? Icons.person_rounded
                      : Icons.groups_rounded,
                  color: colors.primary,
                  size: 20.r,
                ),
                10.pw,
                Expanded(
                  child: Text(
                    selectedEmp?.name ?? 'جميع الموظفين',
                    style: TextStyle(
                      color: selectedId != null ? colors.primary : Colors.white,
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

class _LeavesListBody extends StatelessWidget {
  final int? selectedId;

  const _LeavesListBody({required this.selectedId});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        ManagerLeavesBloc,
        ManagerLeavesState,
        ({bool isLoading, String? errorMessage, List<LeavesDataEntity> leaves})
      >(
        selector: (state) {
          if (state is ManagerLeavesLoadedState) {
            return (
              isLoading: false,
              errorMessage: null,
              leaves: state.leaves.data ?? [],
            );
          }
          if (state is LeavesErrorState) {
            return (
              isLoading: false,
              errorMessage: state.message,
              leaves: const <LeavesDataEntity>[],
            );
          }
          return (
            isLoading: state is ManagerLeavesLoadingState,
            errorMessage: null,
            leaves: const <LeavesDataEntity>[],
          );
        },
        builder: (context, leavesData) {
          if (leavesData.isLoading) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 10.r),
              itemCount: 8,
              itemBuilder: (context, index) => const ListIndicator(),
            );
          }

          if (leavesData.errorMessage != null) {
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: AppErrorState(
                    message: leavesData.errorMessage!,
                    onRetry: () {
                      context.read<ManagerLeavesBloc>().add(
                        const GetManagerLeavesEvent(),
                      );
                      context.read<EmployeesBloc>().add(
                        const GetEmployeesEvent(),
                      );
                    },
                  ),
                ),
              ),
            );
          }

          // Get indexed employees map for O(1) item resolution
          return BlocSelector<
            EmployeesBloc,
            EmployeesState,
            Map<int, EmployeeDataEntity>
          >(
            selector: (empState) {
              final empMap = <int, EmployeeDataEntity>{};
              if (empState is EmployeesLoadedState &&
                  empState.employees.data != null) {
                for (final emp in empState.employees.data!) {
                  if (emp.id != null) {
                    empMap[emp.id!] = emp;
                  }
                }
              }
              return empMap;
            },
            builder: (context, empMap) {
              final filteredLeaves = selectedId != null
                  ? leavesData.leaves
                        .where((e) => e.employeeId == selectedId)
                        .toList()
                  : leavesData.leaves;

              if (filteredLeaves.isEmpty) {
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: AppEmptyState(
                        icon: Icons.event_busy_rounded,
                        title: 'لا توجد طلبات إجازة لعرضها',
                        subtitle: selectedId != null
                            ? 'لم يقم هذا الموظف بتقديم أي طلبات إجازة حتى الآن'
                            : 'لم يقم أي موظف بتقديم طلبات إجازة حتى الآن',
                      ),
                    ),
                  ),
                );
              }

              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.r),
                itemCount: filteredLeaves.length,
                itemBuilder: (context, index) {
                  final leave = filteredLeaves[index];
                  final employee =
                      empMap[leave.employeeId] ?? const EmployeeDataEntity();

                  return LeaveCard(
                    key: ValueKey(leave.id),
                    leave: leave,
                    employeeDataEntity: employee,
                  );
                },
              );
            },
          );
        },
      );
}
