import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/job_card.dart';
import 'package:shimmer/shimmer.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentDataEntity department;
  const DepartmentCard({super.key, required this.department});

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
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 2.r),
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
                onPressed: () => _showAddJobDialog(context, bloc),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 20.r,
                ),
                tooltip: 'تعديل القسم',
                onPressed: () => _showEditDepartmentDialog(context, bloc),
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
                padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
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
                      style: TextButton.styleFrom(foregroundColor: theme.primaryColor),
                      onPressed: () => _showAddJobDialog(context, bloc),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('إضافة وظيفة الآن'),
                    ),
                  ],
                ),
              )
            else ...[
              ...jobs.map((e) => JobCard(job: e, deptId: department.id!)),
              8.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.r),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.primaryColor,
                    side: BorderSide(color: theme.primaryColor.withValues(alpha: 0.4)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8.r),
                  ),
                  onPressed: () => _showAddJobDialog(context, bloc),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text(
                    'إضافة مسمى وظيفي جديد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
    );
  }

  void _showAddJobDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
    final theme = Theme.of(context);
    bloc.jobNameCtrl.clear();

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
            Icon(Icons.add_business_rounded, color: theme.primaryColor, size: 24.r),
            8.pw,
            Text(
              'إضافة وظيفة لـ "${department.name}"',
              style: TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Form(
          key: bloc.jobFormKey,
          child: TextFormField(
            controller: bloc.jobNameCtrl,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'اسم الوظيفة (مثال: مبرمج فلاتر)',
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
            child: Text('إلغاء', style: TextStyle(color: Colors.white.withValues(alpha: 0.7))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {
              if (!bloc.jobFormKey.currentState!.validate()) return;
              bloc.add(AddJobEvent(department.id!));
              NV.pop(ctx);
            },
            child: const Text('إضافة', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditDepartmentDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
    final theme = Theme.of(context);
    bloc.editDeptNameCtrl.text = department.name ?? '';

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
            Text('تعديل اسم القسم', style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Form(
          key: bloc.deptEditfFormKey,
          child: TextFormField(
            controller: bloc.editDeptNameCtrl,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'اسم القسم',
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
              if (val == null || val.trim().isEmpty) return 'يرجى إدخال اسم القسم';
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => NV.pop(ctx),
            child: Text('إلغاء', style: TextStyle(color: Colors.white.withValues(alpha: 0.7))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {
              if (!bloc.deptEditfFormKey.currentState!.validate()) return;
              bloc.add(EditDepartmentEvent(id: department.id!));
              NV.pop(ctx);
            },
            child: const Text('حفظ التعديل', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showDeleteDepartmentDialog(BuildContext context, DepartmentsAndJobsBloc bloc) {
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
            Text('تأكيد حذف القسم', style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.bold)),
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
            onPressed: () => NV.pop(ctx),
            child: Text('إلغاء', style: TextStyle(color: Colors.white.withValues(alpha: 0.7))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {
              bloc.add(DeleteDepartmentsEvent(department.id!));
              NV.pop(ctx);
            },
            child: const Text('حذف القسم'),
          ),
        ],
      ),
    );
  }
}

class DepartmentsIndicator extends StatelessWidget {
  const DepartmentsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.primaryColor.withValues(alpha: 0.15)),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade600,
        child: Row(
          children: [
            Container(
              width: 42.r,
              height: 42.r,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            12.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.r,
                    height: 14.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  8.ph,
                  Container(
                    width: 60.r,
                    height: 10.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
