import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_empty_state.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/departments/presentation/components/departments_card.dart';
import 'package:hr_app/features/manager/departments/presentation/components/departments_form.dart';

class DepartmentsScreen extends StatefulWidget {
  static const routeName = '/departments';
  const DepartmentsScreen({super.key});

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen>
    with AutoConnectivityRestoreMixin {
  late final DepartmentsAndJobsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<DepartmentsAndJobsBloc>()
      ..add(const GetDepartmentsAndJobsEvent());
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(const GetDepartmentsAndJobsEvent());
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        listener: (context, state) {
          if (state is DepartmentsErrorState &&
              (_bloc.departments?.data?.isNotEmpty ?? false)) {
            AppSnackBar.showError(context, state.message);
          }
        },
        child: Builder(
          builder: (context) {
            final bloc = context.read<DepartmentsAndJobsBloc>();

            return Scaffold(
              appBar: AppBar(
                title: const Text('الأقسام والوظائف'),
                leading: const AppBackButton(),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: colors.primary,
                foregroundColor: Colors.black,
                elevation: 4,
                icon: const Icon(Icons.add_business_rounded),
                label: Text(
                  'إضافة قسم',
                  style: context.typography.labelLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () => _openDepartmentForm(context),
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  color: colors.primary,
                  backgroundColor: colors.surface,
                  onRefresh: () async {
                    bloc.add(const GetDepartmentsAndJobsEvent());
                  },
                  child:
                      BlocSelector<
                        DepartmentsAndJobsBloc,
                        DepartmentsAndJobsState,
                        ({
                          bool isLoading,
                          String? errorMessage,
                          List<DepartmentDataEntity> departments,
                        })
                      >(
                        selector: (state) {
                          final deptList = bloc.departments?.data ?? [];
                          return (
                            isLoading: state is DepartmentsLoadingState,
                            errorMessage: state is DepartmentsErrorState
                                ? state.message
                                : null,
                            departments: deptList,
                          );
                        },
                        builder: (context, data) {
                          final deptList = data.departments;
                          final isLoading = data.isLoading;
                          final errorMessage = data.errorMessage;

                          return CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              if (deptList.isNotEmpty)
                                SliverToBoxAdapter(
                                  child: _SummaryBanner(departments: deptList),
                                ),
                              if (isLoading && deptList.isNotEmpty)
                                SliverToBoxAdapter(
                                  child: LinearProgressIndicator(
                                    color: colors.primary,
                                    backgroundColor: colors.secondary,
                                  ),
                                ),
                              if (isLoading && deptList.isEmpty)
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) =>
                                        const DepartmentsIndicator(),
                                    childCount: 6,
                                  ),
                                )
                              else if (errorMessage != null && deptList.isEmpty)
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: AppErrorState(
                                    message: errorMessage,
                                    onRetry: () => bloc.add(
                                      const GetDepartmentsAndJobsEvent(),
                                    ),
                                  ),
                                )
                              else if (deptList.isEmpty)
                                const SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: AppEmptyState(
                                    icon: Icons.corporate_fare_rounded,
                                    title: 'لم يتم إضافة أقسام بعد',
                                    subtitle:
                                        'قم بإضافة أقسام الشركة والوظائف التابعة لها لتنظيم الهيكل الإداري',
                                  ),
                                )
                              else
                                SliverPadding(
                                  padding: EdgeInsets.only(
                                    bottom: 80.h,
                                    top: 4.h,
                                  ),
                                  sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) => DepartmentCard(
                                        key: ValueKey(deptList[index].id),
                                        department: deptList[index],
                                      ),
                                      childCount: deptList.length,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _openDepartmentForm(BuildContext context) async {
    final bloc = context.read<DepartmentsAndJobsBloc>();
    final success = await NavigationHelper.nextScreen<bool>(
      context,
      DepartmentFormScreen(
        rebuild: () {
          bloc.add(const GetDepartmentsAndJobsEvent());
        },
      ),
    );
    if ((success ?? false) && context.mounted) {
      bloc.add(const GetDepartmentsAndJobsEvent());
    }
  }
}

class _SummaryBanner extends StatelessWidget {
  final List<DepartmentDataEntity> departments;

  const _SummaryBanner({required this.departments});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final totalJobs = departments.fold<int>(
      0,
      (sum, dept) => sum + (dept.jobs?.length ?? dept.jobsCount ?? 0),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 8.h, 14.w, 6.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colors.secondary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colors.primary.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(
              icon: Icons.corporate_fare_rounded,
              title: 'الأقسام',
              count: '${departments.length}',
              color: colors.primary,
            ),
            Container(
              width: 1,
              height: 26.h,
              color: Colors.white.withValues(alpha: 0.15),
            ),
            _StatItem(
              icon: Icons.work_outline_rounded,
              title: 'الوظائف المتاحة',
              count: '$totalJobs',
              color: Colors.amberAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
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
