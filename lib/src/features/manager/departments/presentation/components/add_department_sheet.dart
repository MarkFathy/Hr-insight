import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';

class AddDepartmentSheet extends StatelessWidget {
  final DepartmentsAndJobsBloc bloc;

  const AddDepartmentSheet({required this.bloc, super.key});

  static void show(BuildContext context, DepartmentsAndJobsBloc bloc) {
    bloc.deptNameCtrl.clear();
    final colors = context.colors;

    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          side: BorderSide(color: colors.primary.withValues(alpha: 0.3)),
        ),
        builder: (ctx) => AddDepartmentSheet(bloc: bloc),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return Padding(
      padding: EdgeInsets.only(
        left: 20.r,
        right: 20.r,
        top: 16.r,
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom +
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
                  color: colors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.corporate_fare_rounded,
                  color: colors.primary,
                  size: 22.r,
                ),
              ),
              12.pw,
              Text(
                'إضافة قسم جديد',
                style: typography.titleMedium.copyWith(
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
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                filled: true,
                fillColor: colors.secondary,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                  vertical: 14.r,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(
                    color: colors.primary.withValues(alpha: 0.6),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: colors.primary, width: 2),
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
              backgroundColor: colors.primary,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 12.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            onPressed: () {
              if (!bloc.deptFormKey.currentState!.validate()) return;
              bloc.add(const AddDepartmentEvent());
              NavigationHelper.pop(context);
            },
            child: const Text(
              'إضافة القسم',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
