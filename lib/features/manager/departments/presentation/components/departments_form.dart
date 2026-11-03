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

class DepartmentFormScreen extends StatefulWidget {
  final VoidCallback? rebuild;
  final DepartmentDataEntity? data;

  const DepartmentFormScreen({super.key, this.rebuild, this.data});

  @override
  State<DepartmentFormScreen> createState() => _DepartmentFormScreenState();
}

class _DepartmentFormScreenState extends State<DepartmentFormScreen>
    with AutoConnectivityRestoreMixin {
  late final DepartmentsAndJobsBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc = sl<DepartmentsAndJobsBloc>();
    if (widget.data != null) {
      _bloc.editDeptNameCtrl.text = widget.data!.name ?? '';
    } else {
      _bloc.deptNameCtrl.clear();
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
    final isEdit = widget.data != null;

    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        listener: (context, state) {
          if (state is DepartmentsModifiedState) {
            widget.rebuild?.call();
            NavigationHelper.pop(context, true);
            AppSnackBar.showSuccess(
              context,
              isEdit ? 'تم تعديل اسم القسم بنجاح' : 'تمت إضافة القسم بنجاح',
            );
          } else if (state is DepartmentsErrorState) {
            AppSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: colors.background,
          appBar: AppBar(
            leading: const AppBackButton(),
            title: Text(isEdit ? 'تعديل قسم' : 'إضافة قسم جديد'),
            centerTitle: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: AppButton(
                title: isEdit ? 'حفظ التعديلات' : 'إضافة القسم',
                isLoading: state is DepartmentsLoadingState,
                icon: isEdit
                    ? Icons.check_circle_outline_rounded
                    : Icons.add_circle_outline_rounded,
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (isEdit) {
                    _bloc.add(EditDepartmentEvent(id: widget.data!.id!));
                  } else {
                    _bloc.add(const AddDepartmentEvent());
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
                              Icons.corporate_fare_rounded,
                              color: colors.primary,
                              size: 26,
                            ),
                          ),
                          14.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isEdit
                                      ? 'تعديل بيانات القسم'
                                      : 'إنشاء قسم جديد',
                                  style: typography.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                4.ph,
                                Text(
                                  'أدخل اسم القسم لتنظيم الهيكل الإداري والوظائف التابعة له',
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
                          ? _bloc.editDeptNameCtrl
                          : _bloc.deptNameCtrl,
                      label: 'اسم القسم',
                      hintText: 'مثال: الموارد البشرية، البرمجة، التسويق',
                      prefixIcon: Icon(
                        Icons.business_rounded,
                        color: colors.primary,
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'يرجى إدخال اسم القسم';
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
