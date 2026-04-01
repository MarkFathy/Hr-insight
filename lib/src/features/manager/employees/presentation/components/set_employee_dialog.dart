import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';
import 'package:shimmer/shimmer.dart';

class SetEmployeeDialog extends StatelessWidget {
  final EmployeeDataEntity employee;
  final Function() rebuild;
  const SetEmployeeDialog(
      {super.key, required this.rebuild, required this.employee});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? error;
    int? selectedOffice = employee.office?.id;
    int? selectedDepartment = employee.department?.id;
    int? selectedJob = employee.job?.id;

    return BlocProvider(
      create: (context) => sl<OfficesBloc>()..add(const GetOfficesEvent()),
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {
          if (state is OfficesErrorState) showBar(state.message, context);
          if (state is OfficesModifiedState) {
            rebuild();
            NV.pop(context);
          }
        },
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<DepartmentsAndJobsBloc>()
              ..add(const GetDepartmentsAndJobsEvent()),
            child: Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state is OfficesLoadingState)
                    Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.primaryColor,
                        child: DropdownButton(
                            hint: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.0),
                              child: Text('جارى التحميل المكاتب'),
                            ),
                            isExpanded: true,
                            items: const [],
                            onChanged: (val) {})),
                  StatefulBuilder(builder: (context, changeState) {
                    return Column(
                      children: [
                        if (state is OfficesLoadedState)
                          DropdownButton(
                            dropdownColor: MyColors.greyColor,
                              hint: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                child: Text('اختر المكتب'),
                              ),
                              isExpanded: true,
                              value: selectedOffice,
                              items: [
                                if (state.offices.data!.isEmpty)
                                  const DropdownMenuItem(
                                      child: Text('لا يوجد مكاتب')),
                                if (state.offices.data!.isNotEmpty)
                                  ...state.offices.data!
                                      .map((e) => DropdownMenuItem<int>(
                                            value: e.id,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18.0),
                                              child: Text(e.name!),
                                            ),
                                          ))
                              ],
                              onChanged: (value) =>
                                  changeState(() => selectedOffice = value)),
                        BlocBuilder<DepartmentsAndJobsBloc,
                            DepartmentsAndJobsState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                if (state is DepartmentsLoadingState) ...[
                                  Shimmer.fromColors(
                                      baseColor: theme.cardColor,
                                      highlightColor: theme.primaryColor,
                                      child: DropdownButton(
                                          hint: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text('جارى تحميل الأقسام'),
                                          ),
                                          isExpanded: true,
                                          items: const [],
                                          onChanged: (val) {})),
                                  Shimmer.fromColors(
                                      baseColor: theme.cardColor,
                                      highlightColor: theme.primaryColor,
                                      child: DropdownButton(
                                          hint: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text('جارى تحميل الوظائف'),
                                          ),
                                          isExpanded: true,
                                          items: const [],
                                          onChanged: (val) {})),
                                ],
                                if (state is DepartmentsLoadedState) ...[
                                  DropdownButton(
                                      dropdownColor: MyColors.greyColor,
                                      hint: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text('اختر القسم'),
                                      ),
                                      isExpanded: true,
                                      value: selectedDepartment,
                                      items: [
                                        if (state.departments.data!.isEmpty)
                                          const DropdownMenuItem(
                                              child: Text('لا يوجد اقسام')),
                                        if (state.departments.data!.isNotEmpty)
                                          ...state.departments.data!
                                              .map((e) => DropdownMenuItem<int>(
                                                    value: e.id,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 18.0),
                                                      child: Text(e.name!),
                                                    ),
                                                  ))
                                      ],
                                      onChanged: (value) => changeState(() {
                                            selectedDepartment = value;
                                            selectedJob = null;
                                          })),
                                  //
                                  if (selectedDepartment != null)
                                    DropdownButton(
                                        dropdownColor: MyColors.greyColor,

                                        hint: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: Text('اختر المسمى الوظيفى'),
                                        ),
                                        isExpanded: true,
                                        value: selectedJob,
                                        items: [
                                          if (state.departments.data!
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  selectedDepartment)
                                              .jobs!
                                              .isEmpty)
                                            const DropdownMenuItem(
                                                child: Text('لا يوجد وظائف')),
                                          ...state.departments.data!
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  selectedDepartment)
                                              .jobs!
                                              .map((e) => DropdownMenuItem<int>(
                                                    value: e.id,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 18.0),
                                                      child: Text(e.title!),
                                                    ),
                                                  ))
                                        ],
                                        onChanged: (value) => changeState(
                                            () => selectedJob = value)),
                                ],
                              ],
                            );
                          },
                        ),
                        if (error != null)
                          Text(error!,
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: Colors.red)),
                        10.ph,
                        Row(
                          children: [
                            Expanded(
                              child: SButton(
                                  title: 'حفظ',
                                  onTap: () {
                                    if (selectedOffice == null) {
                                      error = 'اختر المكتب';
                                      changeState(() {});
                                      return;
                                    }
                                    context.read<OfficesBloc>().add(
                                        SetEmployeeEvent(
                                            params: SetEmployeeParams(
                                                employeeId: employee.id!,
                                                officeId: selectedOffice,
                                                jobId: selectedJob)));
                                  }),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: TextButton(
                                  child: const Text('إلغاء'),
                                  onPressed: () {
                                    NV.pop(context);
                                  }),
                            ),
                          ],
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
