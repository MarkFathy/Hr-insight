import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:intl/intl.dart';

class LeaveForm extends StatelessWidget {
  static const routeName = '/leave-form';
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => sl<LeavesBloc>(),
      child: BlocConsumer<LeavesBloc, LeavesState>(
        listener: (context, state) {
          if (state is LeaveSentState) {
            showBar('تم إرسال طلب الإجازة بنجاح', context, isSuccess: true);
            NavigationHelper.pop(context);
          }
          if (state is LeavesErrorState) {
            showBar(state.message, context, isError: true);
          }
        },
        builder: (context, state) {
          final bloc = context.read<LeavesBloc>();

          return Dialog(
            backgroundColor: context.colors.surface,
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.r),
              side: BorderSide(
                color: context.colors.primary.withValues(alpha: 0.25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: SingleChildScrollView(
                child: StatefulBuilder(
                  builder: (context, changeState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: context.colors.primary.withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.event_note_rounded,
                                  color: context.colors.primary,
                                  size: 20.r,
                                ),
                              ),
                              8.pw,
                              Text(
                                'تقديم طلب إجازة',
                                style: context.typography.titleMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.close_rounded, color: Colors.white70),
                            onPressed: () => NavigationHelper.pop(context),
                          ),
                        ],
                      ),
                      16.ph,
                      // Start Date Tile
                      _DatePickerTile(
                        label: 'تاريخ بداية الإجازة',
                        selectedDate: bloc.start,
                        onTap: () async {
                          final value = await showDatePicker(
                            context: context,
                            initialDate: bloc.start ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                            currentDate: bloc.start,
                          );
                          if (value != null) {
                            changeState(() {
                              bloc.start = value;
                            });
                          }
                        },
                      ),
                      12.ph,
                      // End Date Tile
                      _DatePickerTile(
                        label: 'تاريخ نهاية الإجازة',
                        selectedDate: bloc.end,
                        onTap: () async {
                          final value = await showDatePicker(
                            context: context,
                            initialDate: bloc.end ?? (bloc.start ?? DateTime.now()),
                            firstDate: bloc.start ?? DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                            currentDate: bloc.end,
                          );
                          if (value != null) {
                            changeState(() {
                              bloc.end = value;
                            });
                          }
                        },
                      ),
                      14.ph,
                      // Leave Type Dropdown
                      Form(
                        key: formKey,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: context.colors.surfaceContainer,
                          borderRadius: BorderRadius.circular(14.r),
                          isExpanded: true,
                          style: context.typography.body.copyWith(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'تصنيف الإجازة',
                            hintText: 'اختر نوع الإجازة',
                            prefixIcon: Icon(
                              Icons.category_outlined,
                              color: context.colors.primary,
                              size: 20.r,
                            ),
                          ),
                          validator: (value) =>
                              value == null ? 'يرجى اختيار تصنيف الإجازة' : null,
                          items: LeaveType.values
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.name,
                                  child: Text(e.label),
                                ),
                              )
                              .toList(),
                          initialValue: bloc.type,
                          onChanged: (value) => changeState(() {
                            bloc.type = value;
                          }),
                        ),
                      ),
                      12.ph,
                      // Notes text field
                      TextFormField(
                        controller: bloc.notesCtrl,
                        maxLines: 3,
                        style: context.typography.body.copyWith(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'الملاحظات (اختياري)',
                          hintText: 'اكتب أي تفاصيل إضافية أو سبب الإجازة...',
                          alignLabelWithHint: true,
                        ),
                      ),
                      20.ph,
                      AppButton(
                        title: 'إرسال طلب الإجازة',
                        isLoading: state is LeavesLoadingState,
                        onTap: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          if (bloc.start == null) {
                            showBar('يرجى تحديد تاريخ بداية الإجازة', context, isError: true);
                            return;
                          }
                          if (bloc.end == null) {
                            showBar('يرجى تحديد تاريخ نهاية الإجازة', context, isError: true);
                            return;
                          }
                          if (!bloc.validateLeaveForm) {
                            return;
                          }
                          bloc.add(const RequestLeaveEvent());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const _DatePickerTile({
    required this.label,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: context.colors.surfaceContainer,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: selectedDate != null
                  ? context.colors.primary.withValues(alpha: 0.4)
                  : Colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: selectedDate != null
                        ? context.colors.primary
                        : context.colors.textSecondary,
                    size: 18.r,
                  ),
                  10.pw,
                  Text(
                    label,
                    style: context.typography.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
              Text(
                selectedDate != null
                    ? DateFormat.yMMMd('ar').format(selectedDate!)
                    : 'حدد التاريخ',
                style: context.typography.bodySmall.copyWith(
                  color: selectedDate != null
                      ? context.colors.primary
                      : context.colors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
