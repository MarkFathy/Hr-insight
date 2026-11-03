import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_button.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/core/widgets/app_text_field.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/presentation/bloc/bloc.dart';

class JobFormScreen extends StatefulWidget {
  final VoidCallback? rebuild;
  final int departmentId;
  final String? departmentName;
  final JobDataEntity? job;

  const JobFormScreen({
    required this.departmentId,
    super.key,
    this.rebuild,
    this.departmentName,
    this.job,
  });

  @override
  State<JobFormScreen> createState() => _JobFormScreenState();
}

class _JobFormScreenState extends State<JobFormScreen>
    with AutoConnectivityRestoreMixin {
  late final DepartmentsAndJobsBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc = sl<DepartmentsAndJobsBloc>();
    if (widget.job != null) {
      _bloc.jobEditNameCtrl.text = widget.job!.title ?? '';
    } else {
      _bloc.jobNameCtrl.clear();
    }
  }

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final isEdit = widget.job != null;

    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        listener: (context, state) {
          if (state is DepartmentsModifiedState) {
            widget.rebuild?.call();
            NavigationHelper.pop(context, true);
            AppSnackBar.showSuccess(
              context,
              isEdit
                  ? 'تم تعديل المسمى الوظيفي بنجاح'
                  : 'تمت إضافة الوظيفة بنجاح',
            );
          } else if (state is DepartmentsErrorState) {
            AppSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: colors.background,
          appBar: AppBar(
            leading: const AppBackButton(),
            title: Text(isEdit ? 'تعديل المسمى الوظيفي' : 'إضافة وظيفة جديدة'),
            centerTitle: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: AppButton(
                title: isEdit ? 'حفظ التعديلات' : 'إضافة الوظيفة',
                isLoading: state is DepartmentsLoadingState,
                icon: isEdit
                    ? Icons.check_circle_outline_rounded
                    : Icons.add_circle_outline_rounded,
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (isEdit) {
                    _bloc.add(
                      EditJobEvent(
                        jobId: widget.job!.id!,
                        departmentId: widget.departmentId,
                      ),
                    );
                  } else {
                    _bloc.add(AddJobEvent(widget.departmentId));
                  }
                },
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors.secondary.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colors.primary.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.primary.withValues(alpha: 0.15),
                              border: Border.all(
                                color: colors.primary.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Icon(
                              Icons.work_outline_rounded,
                              color: colors.primary,
                              size: 24,
                            ),
                          ),
                          14.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.departmentName != null &&
                                    widget.departmentName!.isNotEmpty) ...[
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colors.primary.withValues(
                                        alpha: 0.15,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.corporate_fare_rounded,
                                          size: 13,
                                          color: colors.primary,
                                        ),
                                        5.pw,
                                        Flexible(
                                          child: Text(
                                            widget.departmentName!,
                                            style: TextStyle(
                                              color: colors.primary,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  6.ph,
                                ],
                                Text(
                                  isEdit
                                      ? 'تعديل مسمى وظيفي'
                                      : 'إضافة مسمى وظيفي جديد',
                                  style: typography.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                4.ph,
                                Text(
                                  'حدد المسمى الوظيفي المطلوب إتاحته للموظفين في هذا القسم',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    24.ph,
                    AppTextField(
                      controller: isEdit
                          ? _bloc.jobEditNameCtrl
                          : _bloc.jobNameCtrl,
                      label: 'المسمى الوظيفي',
                      hintText: 'مثال: مهندس برمجيات، محاسب، أخصائي توظيف',
                      prefixIcon: Icon(
                        Icons.badge_outlined,
                        color: colors.primary,
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'يرجى إدخال المسمى الوظيفي';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
