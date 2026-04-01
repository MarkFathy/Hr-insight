import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/card_indicator.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_card.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
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
                        centerTitle: true,
                        bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(50),
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: Builder(
                                builder: (context) {
                                  if (employeesState is EmployeesLoadingState) {
                                    return DropdownButton(
                                        hint: Shimmer.fromColors(
                                            baseColor: Colors.transparent,
                                            highlightColor: theme.primaryColor,
                                            child: const Text('الموظفين')),
                                        isExpanded: true,
                                        underline: const Center(),
                                        items: const [],
                                        onChanged: (val) {});
                                  }
                                  if (employeesState is EmployeesLoadedState) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<int>(
                                          dropdownColor: MyColors.greyColor,
                                          items: [
                                            const DropdownMenuItem(
                                                value: null,
                                                // alignment: Alignment.center,
                                                child: Text('جميع الموظفين')),
                                            ...employeesState.employees.data!
                                                .map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    // alignment: Alignment.center,
                                                    child: Text(e.name!)))
                                                .toList()
                                          ],
                                          underline: const Center(),
                                          hint: const Text('اختر االموظف'),
                                          isExpanded: true,
                                          value: selectedId,
                                          onChanged: (value) {
                                            changeState(() {
                                              selectedId = value;
                                            });
                                          }),
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
