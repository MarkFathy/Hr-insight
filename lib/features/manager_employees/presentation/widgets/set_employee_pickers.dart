import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_bloc.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SetEmployeeOfficePicker extends StatelessWidget {
  final int? selectedOffice;
  final ValueChanged<int?> onOfficeChanged;

  const SetEmployeeOfficePicker({
    required this.selectedOffice,
    required this.onOfficeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<OfficesBloc, OfficesState>(
    buildWhen: (prev, curr) =>
        curr is OfficesLoadingState ||
        curr is OfficesLoadedState ||
        curr is OfficesErrorState,
    builder: (context, state) {
      if (state is OfficesLoadingState) {
        return Shimmer.fromColors(
          baseColor: context.colors.surface,
          highlightColor: context.colors.primary,
          child: DropdownButton<int>(
            hint: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('جارى تحميل المكاتب'),
            ),
            isExpanded: true,
            items: const [],
            onChanged: null,
          ),
        );
      }

      if (state is OfficesLoadedState) {
        final offices = state.offices.data ?? [];
        return DropdownButton<int>(
          dropdownColor: context.colors.surface,
          hint: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text('اختر المكتب'),
          ),
          isExpanded: true,
          value: selectedOffice,
          items: offices.isEmpty
              ? const [DropdownMenuItem(child: Text('لا يوجد مكاتب'))]
              : offices
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e.id,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(e.name ?? ''),
                        ),
                      ),
                    )
                    .toList(),
          onChanged: onOfficeChanged,
        );
      }

      return const SizedBox.shrink();
    },
  );
}

class SetEmployeeDepartmentJobPicker extends StatelessWidget {
  final int? selectedDepartment;
  final int? selectedJob;
  final ValueChanged<int?> onDepartmentChanged;
  final ValueChanged<int?> onJobChanged;

  const SetEmployeeDepartmentJobPicker({
    required this.selectedDepartment,
    required this.selectedJob,
    required this.onDepartmentChanged,
    required this.onJobChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        buildWhen: (prev, curr) =>
            curr is DepartmentsLoadingState ||
            curr is DepartmentsLoadedState ||
            curr is DepartmentsErrorState,
        builder: (context, state) {
          if (state is DepartmentsLoadingState) {
            return Column(
              children: [
                Shimmer.fromColors(
                  baseColor: context.colors.surface,
                  highlightColor: context.colors.primary,
                  child: DropdownButton<int>(
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('جارى تحميل الأقسام'),
                    ),
                    isExpanded: true,
                    items: const [],
                    onChanged: null,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: context.colors.surface,
                  highlightColor: context.colors.primary,
                  child: DropdownButton<int>(
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('جارى تحميل الوظائف'),
                    ),
                    isExpanded: true,
                    items: const [],
                    onChanged: null,
                  ),
                ),
              ],
            );
          }

          if (state is DepartmentsLoadedState) {
            final departments = state.departments.data ?? [];
            final currentDept = departments
                .where((d) => d.id == selectedDepartment)
                .firstOrNull;
            final jobs = currentDept?.jobs ?? [];

            return Column(
              children: [
                DropdownButton<int>(
                  dropdownColor: context.colors.surface,
                  hint: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text('اختر القسم'),
                  ),
                  isExpanded: true,
                  value: selectedDepartment,
                  items: departments.isEmpty
                      ? const [DropdownMenuItem(child: Text('لا يوجد أقسام'))]
                      : departments
                            .map(
                              (e) => DropdownMenuItem<int>(
                                value: e.id,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: Text(e.name ?? ''),
                                ),
                              ),
                            )
                            .toList(),
                  onChanged: onDepartmentChanged,
                ),
                if (selectedDepartment != null)
                  DropdownButton<int>(
                    dropdownColor: context.colors.surface,
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('اختر المسمى الوظيفى'),
                    ),
                    isExpanded: true,
                    value: selectedJob,
                    items: jobs.isEmpty
                        ? const [DropdownMenuItem(child: Text('لا يوجد وظائف'))]
                        : jobs
                              .map(
                                (e) => DropdownMenuItem<int>(
                                  value: e.id,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0,
                                    ),
                                    child: Text(e.title ?? ''),
                                  ),
                                ),
                              )
                              .toList(),
                    onChanged: onJobChanged,
                  ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      );
}
