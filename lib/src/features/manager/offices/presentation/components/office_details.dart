import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/emplyee_card.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/map_view.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_form.dart';
import 'package:hr_app/src/injector.dart';

class OfficeDetailsScreen extends StatelessWidget {
  final OfficeDataEntity office;
  final Function() rebuild;
  const OfficeDetailsScreen(
      {super.key, required this.office, required this.rebuild});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          sl<OfficesBloc>()..add(GetOfficeDetailsEvent(office.id!)),
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {
          if (state is OfficesModifiedState) {
            rebuild();
            NV.pop(context);
          }
        },
        builder: (context, state) {
          final bloc = context.read<OfficesBloc>();
          final employees = (state is OfficeDetailsLoadedState)
              ? (state.details.data?.employees ?? [])
              : <dynamic>[];

          return Scaffold(
            appBar: AppBar(
              leading: const SBackButton(),
              title: Text(office.name ?? 'تفاصيل المكتب'),
              centerTitle: true,
              actions: [
                IconButton(
                  tooltip: 'تعديل المكتب',
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => OfficeForm(
                        rebuild: () {
                          rebuild();
                          NV.pop(context);
                        },
                        data: office,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: theme.primaryColor,
                  ),
                ),
                IconButton(
                  tooltip: 'حذف المكتب',
                  onPressed: () => _showDeleteOfficeDialog(context, bloc),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              bottom: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Map Section
                    if (office.lat != null && office.lng != null)
                      Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Container(
                          height: size.height * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: theme.primaryColor.withValues(alpha: 0.3),
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
                            location: LatLng(office.lat!, office.lng!),
                          ),
                        ),
                      ),

                    // Quick Stats Row
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildInfoTile(
                              theme: theme,
                              icon: Icons.radar_rounded,
                              title: 'نطاق التوقيع',
                              value: '${office.radius.formatRadius} متر',
                              color: theme.primaryColor,
                            ),
                          ),
                          10.pw,
                          Expanded(
                            child: _buildInfoTile(
                              theme: theme,
                              icon: Icons.people_alt_rounded,
                              title: 'الموظفين المعينين',
                              value: '${office.employeeCount ?? 0} موظف',
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
                            color: theme.primaryColor,
                          ),
                          8.pw,
                          Text(
                            'الموظفون التابعون لهذا الفرع',
                            style: theme.textTheme.titleMedium?.copyWith(
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
                              color: theme.primaryColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              '${employees.length}',
                              style: TextStyle(
                                color: theme.primaryColor,
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
                      Padding(
                        padding: EdgeInsets.all(12.r),
                        child: const Row(
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
                                style: TextStyle(
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
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }

  Widget _buildInfoTile({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
        ),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteOfficeDialog(BuildContext context, OfficesBloc bloc) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
          side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
        ),
        title: Row(
          children: [
            Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 24.r),
            8.pw,
            Text(
              'تأكيد حذف المكتب',
              style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text(
          'هل أنت متأكد من حذف فرع "${office.name}" نهائياً؟',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 13.r,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => NV.pop(ctx),
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
              NV.pop(ctx);
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
