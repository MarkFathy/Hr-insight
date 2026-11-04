import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_bloc.dart';
import 'package:hr_app/features/manager_offices/presentation/widgets/office_employees_section.dart';
import 'package:hr_app/features/manager_offices/presentation/widgets/office_form.dart';
import 'package:hr_app/features/manager_offices/presentation/widgets/office_map_card.dart';

/// Screen displaying the geographic, structural, and employee details of an office.
class OfficeDetailsScreen extends StatefulWidget {
  final OfficeDataEntity office;
  final VoidCallback rebuild;

  const OfficeDetailsScreen({
    required this.office,
    required this.rebuild,
    super.key,
  });

  @override
  State<OfficeDetailsScreen> createState() => _OfficeDetailsScreenState();
}

class _OfficeDetailsScreenState extends State<OfficeDetailsScreen>
    with AutoConnectivityRestoreMixin {
  late final OfficesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<OfficesBloc>()..add(GetOfficeDetailsEvent(widget.office.id!));
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(GetOfficeDetailsEvent(widget.office.id!));
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final office = widget.office;

    return BlocProvider.value(
      value: _bloc,
      child: Builder(
        builder: (screenCtx) => BlocListener<OfficesBloc, OfficesState>(
          listener: (context, state) {
            if (state is OfficesModifiedState) {
              widget.rebuild();
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<OfficesBloc, OfficesState>(
            buildWhen: (prev, curr) =>
                curr is OfficeDetailsLoadedState ||
                curr is OfficesLoadingState ||
                curr is OfficesErrorState,
            builder: (context, state) {
              final details = (state is OfficeDetailsLoadedState)
                  ? state.details.data
                  : null;

              final currentName =
                  details?.name ?? office.name ?? 'تفاصيل المكتب';
              final currentLat = details?.lat ?? office.lat;
              final currentLng = details?.lng ?? office.lng;
              final currentRadius = details?.radius ?? office.radius;
              final currentCount =
                  details?.employees?.length ?? office.employeeCount ?? 0;
              final employees = details?.employees ?? <EmployeeDataEntity>[];

              final currentOfficeData = OfficeDataEntity(
                id: details?.id ?? office.id,
                name: currentName,
                lat: currentLat,
                lng: currentLng,
                radius: currentRadius,
                employeeCount: currentCount,
              );

              return Scaffold(
                appBar: AppBar(
                  leading: const AppBackButton(),
                  title: Text(currentName),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      tooltip: 'تعديل المكتب',
                      onPressed: () async {
                        final bloc = screenCtx.read<OfficesBloc>();
                        final result = await NavigationHelper.nextScreen<bool>(
                          screenCtx,
                          OfficeForm(
                            rebuild: () {
                              widget.rebuild();
                              bloc.add(GetOfficeDetailsEvent(office.id!));
                            },
                            data: currentOfficeData,
                          ),
                        );
                        if ((result ?? false) && screenCtx.mounted) {
                          widget.rebuild();
                          bloc.add(GetOfficeDetailsEvent(office.id!));
                        }
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: screenCtx.colors.primary,
                      ),
                    ),
                    IconButton(
                      tooltip: 'حذف المكتب',
                      onPressed: () => _showDeleteOfficeDialog(
                        screenCtx,
                        screenCtx.read<OfficesBloc>(),
                        currentName,
                      ),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OfficeMapCard(
                          lat: currentLat,
                          lng: currentLng,
                          radius: currentRadius,
                          employeeCount: currentCount,
                        ),
                        OfficeEmployeesSection(
                          employees: employees,
                          count: currentCount,
                          isLoading: state is OfficesLoadingState,
                          errorMessage: state is OfficesErrorState
                              ? state.message
                              : null,
                          onRetry: () => screenCtx.read<OfficesBloc>().add(
                            GetOfficeDetailsEvent(office.id!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showDeleteOfficeDialog(
    BuildContext context,
    OfficesBloc bloc, [
    String? officeName,
  ]) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: ctx.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.delete_outline_rounded,
                color: Colors.redAccent,
                size: 24,
              ),
              8.pw,
              const Text(
                'تأكيد حذف المكتب',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            officeName != null
                ? 'هل أنت متأكد من حذف مكتب "$officeName"؟ سيتم إلغاء تعيين الموظفين المرتبطين به.'
                : 'هل أنت متأكد من رغبتك في حذف هذا المكتب نهائياً؟',
            style: const TextStyle(fontSize: 13, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                bloc.add(DeleteOfficesEvent(widget.office.id!));
              },
              child: const Text(
                'حذف',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
