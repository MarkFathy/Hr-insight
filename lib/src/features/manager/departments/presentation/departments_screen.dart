import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/departments_card.dart';
import 'package:hr_app/src/injector.dart';

class DepartmentsScreen extends StatelessWidget {
  static const routeName = '/departments';
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          sl<DepartmentsAndJobsBloc>()..add(const GetDepartmentsAndJobsEvent()),
      child: BlocConsumer<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        listener: (context, state) {
          if (state is DepartmentsErrorState) {
            showBar(state.message, context);
          }
        },
        builder: (context, state) {
          final bloc = context.read<DepartmentsAndJobsBloc>();
          final deptList = bloc.departments?.data ?? [];
          final totalJobs = deptList.fold<int>(
            0,
            (sum, dept) => sum + (dept.jobs?.length ?? dept.jobsCount ?? 0),
          );

          return Scaffold(
            appBar: AppBar(
              title: const SText('الأقسام و الوظائف'),
              leading: const SBackButton(),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.r),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: theme.primaryColor.withValues(alpha: 0.15),
                    ),
                    icon: Icon(
                      Icons.add_rounded,
                      color: theme.primaryColor,
                      size: 24.r,
                    ),
                    tooltip: 'إضافة قسم جديد',
                    onPressed: () => _showAddDepartmentModal(context, bloc),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.black,
              icon: const Icon(Icons.add_business_rounded),
              label: const Text(
                'إضافة قسم',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => _showAddDepartmentModal(context, bloc),
            ),
            body: SafeArea(
              bottom: true,
              child: RefreshIndicator(
                color: theme.primaryColor,
                backgroundColor: theme.colorScheme.secondary,
                onRefresh: () async {
                  bloc.add(const GetDepartmentsAndJobsEvent());
                },
                child: CustomScrollView(
                slivers: [
                  // Summary Banner
                  if (deptList.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14.r, 8.r, 14.r, 6.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.r,
                            vertical: 10.r,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: theme.primaryColor.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem(
                                icon: Icons.corporate_fare_rounded,
                                title: 'الأقسام',
                                count: '${deptList.length}',
                                color: theme.primaryColor,
                              ),
                              Container(
                                width: 1,
                                height: 26.r,
                                color: Colors.white.withValues(alpha: 0.15),
                              ),
                              _buildStatItem(
                                icon: Icons.work_outline_rounded,
                                title: 'الوظائف المتاحة',
                                count: '$totalJobs',
                                color: Colors.amberAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Linear loading on mutation
                  if (state is DepartmentsLoadingState && deptList.isNotEmpty)
                    SliverToBoxAdapter(
                      child: LinearProgressIndicator(
                        color: theme.primaryColor,
                        backgroundColor: theme.colorScheme.secondary,
                      ),
                    ),

                  // Initial loading shimmers
                  if (state is DepartmentsLoadingState && deptList.isEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const DepartmentsIndicator(),
                        childCount: 6,
                      ),
                    )
                  else if (deptList.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.primaryColor.withValues(alpha: 0.1),
                                ),
                                child: Icon(
                                  Icons.corporate_fare_rounded,
                                  size: 48.r,
                                  color: theme.primaryColor.withValues(alpha: 0.7),
                                ),
                              ),
                              16.ph,
                              const Text(
                                'لم يتم إضافة أقسام بعد',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              6.ph,
                              Text(
                                'قم بإضافة أقسام الشركة والوظائف التابعة لها لتنظيم الهيكل الإداري',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 12,
                                ),
                              ),
                              18.ph,
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primaryColor,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.r,
                                    vertical: 10.r,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () =>
                                    _showAddDepartmentModal(context, bloc),
                                icon: const Icon(Icons.add_rounded),
                                label: const Text(
                                  'إضافة أول قسم',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 80.r, top: 4.r),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => DepartmentCard(
                            department: deptList[index],
                          ),
                          childCount: deptList.length,
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

  Widget _buildStatItem({
    required IconData icon,
    required String title,
    required String count,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.r, color: color),
        8.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.r,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 10.r,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showAddDepartmentModal(BuildContext context, DepartmentsAndJobsBloc bloc) {
    final theme = Theme.of(context);
    bloc.deptNameCtrl.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        side: BorderSide(color: theme.primaryColor.withValues(alpha: 0.3)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20.r,
          right: 20.r,
          top: 16.r,
          bottom: MediaQuery.of(ctx).viewInsets.bottom +
              MediaQuery.of(ctx).padding.bottom +
              20.r,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40.r,
                height: 4.r,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            16.ph,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.corporate_fare_rounded,
                    color: theme.primaryColor,
                    size: 22.r,
                  ),
                ),
                12.pw,
                Text(
                  'إضافة قسم جديد',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            16.ph,
            Form(
              key: bloc.deptFormKey,
              child: TextFormField(
                controller: bloc.deptNameCtrl,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'اسم القسم (مثال: الموارد البشرية، البرمجة)',
                  hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                  filled: true,
                  fillColor: theme.colorScheme.secondary,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.r,
                    vertical: 14.r,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(
                      color: theme.primaryColor.withValues(alpha: 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(
                      color: theme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'يرجى إدخال اسم القسم';
                  }
                  return null;
                },
              ),
            ),
            16.ph,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              onPressed: () {
                if (!bloc.deptFormKey.currentState!.validate()) return;
                bloc.add(const AddDepartmentEvent());
                NV.pop(ctx);
              },
              child: const Text(
                'إضافة القسم',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
