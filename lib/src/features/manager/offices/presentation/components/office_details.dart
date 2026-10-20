import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_card.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/map_view.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_form.dart';
import 'package:latlong2/latlong.dart';

class OfficeDetailsScreen extends StatelessWidget {
  final OfficeDataEntity office;
  final VoidCallback rebuild;
  const OfficeDetailsScreen({
    required this.office, required this.rebuild, super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) =>
          sl<OfficesBloc>()..add(GetOfficeDetailsEvent(office.id!)),
      child: Builder(
        builder: (screenCtx) => BlocListener<OfficesBloc, OfficesState>(
          listener: (context, state) {
            if (state is OfficesModifiedState) {
              rebuild();
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<OfficesBloc, OfficesState>(
            buildWhen: (prev, curr) =>
                curr is OfficeDetailsLoadedState ||
                curr is OfficesLoadingState,
            builder: (context, state) {
              final details = (state is OfficeDetailsLoadedState)
                  ? state.details.data
                  : null;

              final currentName =
                  details?.name ?? office.name ?? 'تفاصيل المكتب';
              final currentLat = details?.lat ?? office.lat;
              final currentLng = details?.lng ?? office.lng;
              final currentRadius = details?.radius ?? office.radius;
              final currentCount = details?.employees?.length ??
                  office.employeeCount ??
                  0;
              final employees =
                  details?.employees ?? <EmployeeDataEntity>[];

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
                              rebuild();
                              bloc.add(GetOfficeDetailsEvent(office.id!));
                            },
                            data: currentOfficeData,
                          ),
                        );
                        if ((result ?? false) && screenCtx.mounted) {
                          rebuild();
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
                        // Map Section
                        if (currentLat != null && currentLng != null)
                          Padding(
                            padding: EdgeInsets.all(12.r),
                            child: Container(
                              height: size.height * 0.32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: context.colors.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: MapViewScreen(
                                key: ValueKey('$currentLat-$currentLng'),
                                location: LatLng(currentLat, currentLng),
                              ),
                            ),
                          ),

                        // Quick Stats Row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.r),
                          child: Row(
                            children: [
                              Expanded(
                                child: _OfficeInfoTile(
                                  icon: Icons.radar_rounded,
                                  title: 'نطاق التوقيع',
                                  value: '${currentRadius.formatRadius} متر',
                                  color: context.colors.primary,
                                ),
                              ),
                              10.pw,
                              Expanded(
                                child: _OfficeInfoTile(
                                  icon: Icons.people_alt_rounded,
                                  title: 'الموظفين المعينين',
                                  value: '$currentCount موظف',
                                  color: Colors.cyanAccent,
                                ),
                              ),
                            ],
                          ),
                        ),

                        16.ph,

                        // Section Title
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: Row(
                            children: [
                              Icon(
                                Icons.groups_rounded,
                                size: 20.r,
                                color: context.colors.primary,
                              ),
                              8.pw,
                              Text(
                                'الموظفون التابعون لهذا الفرع',
                                style: context.typography.titleMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15.r,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.r,
                                  vertical: 2.r,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colors.primary.withValues(
                                    alpha: 0.15,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  '$currentCount',
                                  style: TextStyle(
                                    color: context.colors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        8.ph,

                        // Employees List
                        if (state is OfficesLoadingState)
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(child: EmployeeIndicator()),
                                SizedBox(width: 10),
                                Expanded(child: EmployeeIndicator()),
                              ],
                            ),
                          )
                        else if (employees.isEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 36.r),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person_off_outlined,
                                    size: 38.r,
                                    color: Colors.white.withValues(alpha: 0.4),
                                  ),
                                  8.ph,
                                  Text(
                                    'لا يوجد موظفون معينون في هذا المكتب حتى الآن',
                                    style: context.typography.bodySmall.copyWith(
                                      color: Colors.white.withValues(alpha: 0.5),
                                      fontSize: 12.r,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.r, 0, 12.r, 20.r),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.05.r,
                                    mainAxisSpacing: 10.r,
                                    crossAxisSpacing: 10.r,
                                  ),
                              itemCount: employees.length,
                              itemBuilder: (context, index) => EmployeeCard(
                                employee: employees[index],
                                inOffice: true,
                              ),
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
            borderRadius: BorderRadius.circular(18.r),
            side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
          ),
          title: Row(
            children: [
              Icon(
                Icons.delete_outline_rounded,
                color: Colors.redAccent,
                size: 24.r,
              ),
              8.pw,
              Text(
                'تأكيد حذف المكتب',
                style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'هل أنت متأكد من حذف فرع "${officeName ?? office.name}" نهائياً؟',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 13.r,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'إلغاء',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {
                bloc.add(DeleteOfficesEvent(office.id!));
                Navigator.pop(ctx);
              },
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfficeInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _OfficeInfoTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20.r, color: color),
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 10.r,
                  ),
                ),
                2.ph,
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
