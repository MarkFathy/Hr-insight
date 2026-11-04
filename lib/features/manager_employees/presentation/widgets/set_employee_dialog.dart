import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/shared/widgets/app_snack_bar.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_bloc.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/set_employee_pickers.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_bloc.dart';

class SetEmployeeDialog extends StatefulWidget {
  final EmployeeDataEntity employee;
  final VoidCallback rebuild;

  const SetEmployeeDialog({
    required this.rebuild,
    required this.employee,
    super.key,
  });

  @override
  State<SetEmployeeDialog> createState() => _SetEmployeeDialogState();
}

class _SetEmployeeDialogState extends State<SetEmployeeDialog>
    with AutoConnectivityRestoreMixin {
  String? _error;
  int? _selectedOffice;
  int? _selectedDepartment;
  int? _selectedJob;
  late final OfficesBloc _officesBloc;
  late final DepartmentsAndJobsBloc _departmentsBloc;

  @override
  void initState() {
    super.initState();
    _selectedOffice = widget.employee.office?.id;
    _selectedDepartment = widget.employee.department?.id;
    _selectedJob = widget.employee.job?.id;
    _officesBloc = sl<OfficesBloc>()..add(const GetOfficesEvent());
    _departmentsBloc = sl<DepartmentsAndJobsBloc>()
      ..add(const GetDepartmentsAndJobsEvent());
  }

  @override
  void onConnectivityRestored() {
    _officesBloc.add(const GetOfficesEvent());
    _departmentsBloc.add(const GetDepartmentsAndJobsEvent());
  }

  @override
  void dispose() {
    unawaited(_officesBloc.close());
    unawaited(_departmentsBloc.close());
    super.dispose();
  }

  void _handleSave(BuildContext context) {
    if (_selectedOffice == null) {
      setState(() {
        _error = 'اختر المكتب';
      });
      return;
    }
    context.read<OfficesBloc>().add(
      SetEmployeeEvent(
        params: SetEmployeeParams(
          employeeId: widget.employee.id!,
          officeId: _selectedOffice,
          jobId: _selectedJob,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider.value(value: _officesBloc),
      BlocProvider.value(value: _departmentsBloc),
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
              SetEmployeeOfficePicker(
                selectedOffice: _selectedOffice,
                onOfficeChanged: (value) {
                  setState(() {
                    _selectedOffice = value;
                    _error = null;
                  });
                },
              ),
              SizedBox(height: context.spacing.sm),
              SetEmployeeDepartmentJobPicker(
                selectedDepartment: _selectedDepartment,
                selectedJob: _selectedJob,
                onDepartmentChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                    _selectedJob = null;
                  });
                },
                onJobChanged: (value) {
                  setState(() {
                    _selectedJob = value;
                  });
                },
              ),
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
              Builder(
                builder: (btnContext) => Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'حفظ',
                        onTap: () => _handleSave(btnContext),
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
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
