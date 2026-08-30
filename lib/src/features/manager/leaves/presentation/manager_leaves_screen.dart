import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/card_indicator.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_card.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_picker_sheet.dart';
import 'package:hr_app/src/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';
import 'package:shimmer/shimmer.dart';

class ManagerLeavesScreen extends StatelessWidget {
  static const routeName = '/manager-leaves';
  const ManagerLeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int? selectedId;
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          sl<ManagerLeavesBloc>()..add(GetManagerLeavesEvent()),
      child: BlocConsumer<ManagerLeavesBloc, ManagerLeavesState>(
        listener: (context, state) {},
        builder: (context, leavesState) {
          return BlocProvider(
            create: (context) =>
                sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
            child: BlocBuilder<EmployeesBloc, EmployeesState>(
              builder: (context, employeesState) {
                return StatefulBuilder(builder: (context, changeState) {
                  return Scaffold(
                      appBar: AppBar(
                        title: const Text('طلبات الإنصراف'),
                        leading: const SBackButton(),
                        centerTitle: true,
                        bottom: PreferredSize(
                            preferredSize: Size.fromHeight(56.r),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 10.r),
                              child: Builder(
                                builder: (context) {
                                  if (employeesState is EmployeesLoadingState) {
                                    return Container(
                                      height: 44.r,
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.secondary.withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(14.r),
                                      ),
                                      child: Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.transparent,
                                          highlightColor: theme.primaryColor,
                                          child: const Text('جاري تحميل الموظفين...'),
                                        ),
                                      ),
                                    );
                                  }
                                  if (employeesState is EmployeesLoadedState) {
                                    final employeesList = employeesState.employees.data ?? [];
                                    final selectedEmp = selectedId != null
                                        ? employeesList.firstWhere(
                                            (e) => e.id == selectedId,
                                            orElse: () => const EmployeeDataEntity(),
                                          )
                                        : null;
                                    return InkWell(
                                      onTap: () {
                                        EmployeePickerSheet.show(
                                          context: context,
                                          employees: employeesList,
                                          selectedId: selectedId,
                                          showAllOption: true,
                                          onSelected: (emp) {
                                            changeState(() {
                                              selectedId = emp?.id;
                                            });
                                          },
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(14.r),
                                      child: Container(
                                        height: 46.r,
                                        padding: EdgeInsets.symmetric(horizontal: 14.r),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.secondary,
                                          borderRadius: BorderRadius.circular(14.r),
                                          border: Border.all(
                                            color: selectedId != null
                                                ? theme.primaryColor
                                                : theme.primaryColor.withValues(alpha: 0.25),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              selectedId != null
                                                  ? Icons.person_rounded
                                                  : Icons.groups_rounded,
                                              color: theme.primaryColor,
                                              size: 20.r,
                                            ),
                                            10.pw,
                                            Expanded(
                                              child: Text(
                                                selectedEmp?.name ?? 'جميع الموظفين',
                                                style: TextStyle(
                                                  color: selectedId != null
                                                      ? theme.primaryColor
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.r,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(4.r),
                                              decoration: BoxDecoration(
                                                color: theme.primaryColor.withValues(alpha: 0.12),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: theme.primaryColor,
                                                size: 18.r,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            )),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            10.ph,
                            if (leavesState is ManagerLeavesLoadingState ||
                                context.watch<EmployeesBloc>().employees ==
                                    null)
                              ...List.generate(
                                10,
                                (index) => const ListIndicator(),
                              ),
                            if (leavesState is ManagerLeavesLoadedState &&
                                context.watch<EmployeesBloc>().employees !=
                                    null)
                              ...leavesState.leaves.data!
                                  .where((element) {
                                    if (selectedId != null) {
                                      return element.employeeId == selectedId!;
                                    } else {
                                      return true;
                                    }
                                  })
                                  .map((e) => LeaveCard(
                                      leave: e,
                                      employeeDataEntity: context
                                          .watch<EmployeesBloc>()
                                          .employees!
                                          .data!
                                          .firstWhere(
                                              (element) =>
                                                  element.id == e.employeeId,
                                              orElse: () =>
                                                  const EmployeeDataEntity())))
                                  .toList()
                          ],
                        ),
                      ));
                });
              },
            ),
          );
        },
      ),
    );
  }
}
