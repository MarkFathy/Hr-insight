import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/job_form.dart';

class JobCard extends StatelessWidget {
  final JobDataEntity job;
  final int deptId;
  const JobCard({required this.job, required this.deptId, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<DepartmentsAndJobsBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.r),
      child: Material(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: theme.primaryColor.withValues(alpha: 0.15),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 2.r),
          leading: Container(
            width: 38.r,
            height: 38.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor.withValues(alpha: 0.12),
            ),
            child: Icon(
              Icons.work_outline_rounded,
              color: theme.primaryColor,
              size: 20.r,
            ),
          ),
          title: Text(
            job.title ?? 'بدون اسم',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 13.r,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 3.r),
            child: Row(
              children: [
                Icon(
                  Icons.people_outline_rounded,
                  size: 13.r,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
                4.pw,
                Text(
                  '${job.employeesCount ?? 0} موظف',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 11.r,
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
                  Icons.edit_outlined,
                  color: theme.primaryColor,
                  size: 20.r,
                ),
                tooltip: 'تعديل الوظيفة',
                onPressed: () => _openEditJobScreen(context, bloc),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.redAccent,
                  size: 20.r,
                ),
                tooltip: 'حذف الوظيفة',
                onPressed: () => _showDeleteJobDialog(context, bloc),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openEditJobScreen(
    BuildContext context,
    DepartmentsAndJobsBloc bloc,
  ) async {
    final success = await NavigationHelper.nextScreen<bool>(
      context,
      JobFormScreen(
        departmentId: deptId,
        job: job,
        rebuild: () {
          bloc.add(const GetDepartmentsAndJobsEvent());
        },
      ),
    );
    if ((success ?? false) && context.mounted) {
      bloc.add(const GetDepartmentsAndJobsEvent());
    }
  }

  void _showDeleteJobDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
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
                'تأكيد حذف الوظيفة',
                style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'هل أنت متأكد من حذف وظيفة "${job.title}"؟',
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
                bloc.add(DeleteJobEvent(job.id!));
                NavigationHelper.pop(ctx);
              },
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );
  }
}
