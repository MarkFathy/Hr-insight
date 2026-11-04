import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:hr_app/core/shared/widgets/app_snack_bar.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_bloc.dart';
import 'package:intl/intl.dart';

class LeaveForm extends StatefulWidget {
  static const routeName = '/leave-form';
  const LeaveForm({super.key});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm>
    with AutoConnectivityRestoreMixin {
  final _formKey = GlobalKey<FormState>();
  late final LeavesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<LeavesBloc>();
  }

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _bloc,
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
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(
              color: context.colors.primary.withValues(alpha: 0.25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
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
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: context.colors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.event_note_rounded,
                                color: context.colors.primary,
                                size: 20,
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
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white70,
                          ),
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
                          initialDate:
                              bloc.end ?? (bloc.start ?? DateTime.now()),
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
                      key: _formKey,
                      child: DropdownButtonFormField<String>(
                        dropdownColor: context.colors.surfaceContainer,
                        borderRadius: BorderRadius.circular(14),
                        isExpanded: true,
                        style: context.typography.body.copyWith(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'تصنيف الإجازة',
                          hintText: 'اختر نوع الإجازة',
                          prefixIcon: Icon(
                            Icons.category_outlined,
                            color: context.colors.primary,
                            size: 20,
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
                      style: context.typography.body.copyWith(
                        color: Colors.white,
                      ),
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
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (bloc.start == null) {
                          showBar(
                            'يرجى تحديد تاريخ بداية الإجازة',
                            context,
                            isError: true,
                          );
                          return;
                        }
                        if (bloc.end == null) {
                          showBar(
                            'يرجى تحديد تاريخ نهاية الإجازة',
                            context,
                            isError: true,
                          );
                          return;
                        }
                        if (!bloc.validateLeaveForm) {
                          return;
                        }
                        bloc.add(
                          RequestLeaveEvent(
                            params: LeaveParams(
                              notes: bloc.notesCtrl.text.trim(),
                              from: bloc.start,
                              to: bloc.end,
                              leaveType: bloc.type,
                            ),
                          ),
                        );
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
    borderRadius: BorderRadius.circular(14),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(14),
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
                size: 18,
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
