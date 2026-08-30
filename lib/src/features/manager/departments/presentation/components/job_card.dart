import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';

class JobCard extends StatelessWidget {
  final JobDataEntity job;
  final int deptId;
  const JobCard({super.key, required this.job, required this.deptId});

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
            width: 1,
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
              onPressed: () => _showEditJobDialog(context, bloc),
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

  void _showEditJobDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
    final theme = Theme.of(context);
    bloc.jobEditNameCtrl.text = job.title ?? '';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
          side: BorderSide(color: theme.primaryColor.withValues(alpha: 0.3)),
        ),
        title: Row(
          children: [
            Icon(Icons.edit_note_rounded, color: theme.primaryColor, size: 24.r),
            8.pw,
            Text(
              'تعديل المسمى الوظيفي',
              style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Form(
          key: bloc.jobEditfFormKey,
          child: TextFormField(
            controller: bloc.jobEditNameCtrl,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'اسم الوظيفة',
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
              filled: true,
              fillColor: theme.colorScheme.secondary,
              contentPadding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 12.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
              ),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) return 'يرجى إدخال اسم الوظيفة';
              return null;
            },
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
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              if (!bloc.jobEditfFormKey.currentState!.validate()) return;
              bloc.add(EditJobEvent(jobId: job.id!, departmentId: deptId));
              NV.pop(ctx);
            },
            child: const Text('حفظ التعديل', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showDeleteJobDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
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
              bloc.add(DeleteJobEvent(job.id!));
              NV.pop(ctx);
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
