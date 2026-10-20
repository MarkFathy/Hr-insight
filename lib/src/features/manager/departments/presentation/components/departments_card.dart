import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/departments_form.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/job_card.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/job_form.dart';

export 'departments_indicator.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentDataEntity department;
  const DepartmentCard({required this.department, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<DepartmentsAndJobsBloc>();
    final jobs = department.jobs ?? [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
      child: Material(
        color: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: theme.primaryColor.withValues(alpha: 0.25),
            width: 1.2,
          ),
        ),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: theme.copyWith(
            dividerColor: Colors.transparent,
            splashColor: theme.primaryColor.withValues(alpha: 0.1),
            highlightColor: theme.primaryColor.withValues(alpha: 0.05),
          ),
          child: ExpansionTile(
            key: ValueKey(department.id),
            tilePadding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 4.r),
            childrenPadding: EdgeInsets.only(bottom: 12.r),
            leading: Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor.withValues(alpha: 0.15),
                border: Border.all(
                  color: theme.primaryColor.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.corporate_fare_rounded,
                color: theme.primaryColor,
                size: 22.r,
              ),
            ),
            title: Text(
              department.name ?? 'بدون اسم',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15.r,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 4.r),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.r,
                      vertical: 2.r,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '${jobs.length} وظائف',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 11.r,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    color: theme.primaryColor,
                    size: 22.r,
                  ),
                  tooltip: 'إضافة وظيفة',
                  onPressed: () => _openAddJobScreen(context, bloc),
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20.r,
                  ),
                  tooltip: 'تعديل القسم',
                  onPressed: () => _openEditDepartmentScreen(context, bloc),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                  tooltip: 'حذف القسم',
                  onPressed: () => _showDeleteDepartmentDialog(context, bloc),
                ),
              ],
            ),
            children: [
              const Divider(height: 1, indent: 14, endIndent: 14),
              8.ph,
              if (jobs.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.r,
                    horizontal: 16.r,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'لا توجد وظائف مضافة في هذا القسم حتى الآن',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12.r,
                        ),
                      ),
                      8.ph,
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.primaryColor,
                        ),
                        onPressed: () => _openAddJobScreen(context, bloc),
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('إضافة وظيفة الآن'),
                      ),
                    ],
                  ),
                )
              else ...[
                ...jobs.map((e) => JobCard(job: e, deptId: department.id!)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openAddJobScreen(
    BuildContext context,
    DepartmentsAndJobsBloc bloc,
  ) async {
    final success = await NavigationHelper.nextScreen<bool>(
      context,
      JobFormScreen(
        departmentId: department.id!,
        departmentName: department.name,
        rebuild: () {
          bloc.add(const GetDepartmentsAndJobsEvent());
        },
      ),
    );
    if ((success ?? false) && context.mounted) {
      bloc.add(const GetDepartmentsAndJobsEvent());
    }
  }

  Future<void> _openEditDepartmentScreen(
    BuildContext context,
    DepartmentsAndJobsBloc bloc,
  ) async {
    final success = await NavigationHelper.nextScreen<bool>(
      context,
      DepartmentFormScreen(
        data: department,
        rebuild: () {
          bloc.add(const GetDepartmentsAndJobsEvent());
        },
      ),
    );
    if ((success ?? false) && context.mounted) {
      bloc.add(const GetDepartmentsAndJobsEvent());
    }
  }

  void _showDeleteDepartmentDialog(
    BuildContext context,
    DepartmentsAndJobsBloc bloc,
  ) {
    final theme = Theme.of(context);
    unawaited(
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: theme.scaffoldBackgroundColor,
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
                'تأكيد حذف القسم',
                style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'سيتم حذف قسم "${department.name}" وجميع الوظائف التابعة له نهائياً.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 13.r,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => NavigationHelper.pop(ctx),
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
                bloc.add(DeleteDepartmentsEvent(department.id!));
                NavigationHelper.pop(ctx);
              },
              child: const Text('حذف القسم'),
            ),
          ],
        ),
      ),
    );
  }
}
