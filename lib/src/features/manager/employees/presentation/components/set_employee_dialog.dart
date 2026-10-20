import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';

class SetEmployeeDialog extends StatefulWidget {
  final EmployeeDataEntity employee;
  final VoidCallback rebuild;

  const SetEmployeeDialog({
    required this.rebuild, required this.employee, super.key,
  });

  @override
  State<SetEmployeeDialog> createState() => _SetEmployeeDialogState();
}

class _SetEmployeeDialogState extends State<SetEmployeeDialog> {
  String? _error;
  int? _selectedOffice;
  int? _selectedDepartment;
  int? _selectedJob;

  @override
  void initState() {
    super.initState();
    _selectedOffice = widget.employee.office?.id;
    _selectedDepartment = widget.employee.department?.id;
    _selectedJob = widget.employee.job?.id;
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<OfficesBloc>()..add(const GetOfficesEvent()),
        ),
        BlocProvider(
          create: (_) =>
              sl<DepartmentsAndJobsBloc>()
                ..add(const GetDepartmentsAndJobsEvent()),
        ),
      ],
      child: BlocListener<OfficesBloc, OfficesState>(
        listener: (context, state) {
          if (state is OfficesErrorState) {
            showBar(state.message, context);
          } else if (state is OfficesModifiedState) {
            widget.rebuild();
            Navigator.pop(context);
          }
        },
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: context.radius.mdBorder),
          backgroundColor: context.colors.surface,
          child: Padding(
            padding: EdgeInsets.all(context.spacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'تعيين الموظف',
                  style: context.typography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.spacing.md),
                _buildOfficesSection(),
                SizedBox(height: context.spacing.sm),
                _buildDepartmentsAndJobsSection(),
                if (_error != null) ...[
                  SizedBox(height: context.spacing.xs),
                  Text(
                    _error!,
                    style: context.typography.bodySmall.copyWith(
                      color: context.colors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                SizedBox(height: context.spacing.md),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );

  Widget _buildOfficesSection() => BlocBuilder<OfficesBloc, OfficesState>(
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
            value: _selectedOffice,
            items: offices.isEmpty
                ? const [DropdownMenuItem(child: Text('لا يوجد مكاتب'))]
                : offices
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
            onChanged: (value) {
              setState(() {
                _selectedOffice = value;
                _error = null;
              });
            },
          );
        }

        return const SizedBox.shrink();
      },
    );

  Widget _buildDepartmentsAndJobsSection() => BlocBuilder<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
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
              .where((d) => d.id == _selectedDepartment)
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
                value: _selectedDepartment,
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
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                    _selectedJob = null;
                  });
                },
              ),
              if (_selectedDepartment != null)
                DropdownButton<int>(
                  dropdownColor: context.colors.surface,
                  hint: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text('اختر المسمى الوظيفى'),
                  ),
                  isExpanded: true,
                  value: _selectedJob,
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
                  onChanged: (value) {
                    setState(() {
                      _selectedJob = value;
                    });
                  },
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );

  Widget _buildActionButtons() => Builder(
      builder: (btnContext) => Row(
        children: [
          Expanded(
            child: SButton(
              title: 'حفظ',
              onTap: () {
                if (_selectedOffice == null) {
                  setState(() {
                    _error = 'اختر المكتب';
                  });
                  return;
                }
                btnContext.read<OfficesBloc>().add(
                  SetEmployeeEvent(
                    params: SetEmployeeParams(
                      employeeId: widget.employee.id!,
                      officeId: _selectedOffice,
                      jobId: _selectedJob,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextButton(
              child: const Text('إلغاء'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
}
