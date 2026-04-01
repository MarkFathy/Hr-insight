import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';
import 'package:intl/intl.dart';

class LeaveForm extends StatelessWidget {
  static const routeName = '/leave-form';
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final size = MediaQuery.sizeOf(context);
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => sl<LeavesBloc>(),
      child: BlocConsumer<LeavesBloc, LeavesState>(
        listener: (context, state) {
          if (state is LeaveSentState) NV.pop(context);
        },
        builder: (context, state) {
          final bloc = context.read<LeavesBloc>();
          return Dialog(
            backgroundColor: theme.colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: SingleChildScrollView(
                child: Builder(builder: (context) {
                  return StatefulBuilder(builder: (context, changeState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'طلب إجازة',
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                        ),
                        Divider(color: theme.primaryColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تاريخ البداية',
                              style: theme.textTheme.titleMedium!
                                  .copyWith(color: theme.primaryColor),
                            ),
                            InkWell(
                              onTap: () => showDatePicker(

                                      context: context,
                                      initialDate: bloc.start ?? DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                      currentDate: bloc.start)
                                  .then((value) => changeState(() {
                                        bloc.start = value;
                                      })),
                              child: Material(
                                color: MyColors.greyColor,
                                child: bloc.start != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          DateFormat.yMMMEd('ar')
                                              .format(bloc.start!),
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: theme.primaryColor),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'اختر تاريخ البداية',
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: theme.primaryColor),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: theme.primaryColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تاريخ النهاية',
                              style: theme.textTheme.titleMedium!
                                  .copyWith(color: theme.primaryColor),
                            ),
                            InkWell(
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: bloc.end ?? DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                      currentDate: bloc.end)
                                  .then((value) => changeState(() {
                                        bloc.end = value;
                                      })),
                              child: Material(
                                color: MyColors.greyColor,
                                child: bloc.end != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          DateFormat.yMMMEd('ar')
                                              .format(bloc.end!),
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: theme.primaryColor),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'اختر تاريخ النهاية',
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: theme.primaryColor),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: theme.primaryColor),
                        10.ph,
                        Form(
                          key: formKey,
                          child: DropdownButtonFormField(
                            dropdownColor: MyColors.greyColor,
                            borderRadius: BorderRadius.circular(6),
                            isExpanded: true,
                            decoration: InputDecoration(
                                fillColor: theme.scaffoldBackgroundColor,
                                filled: true,
                                border: InputBorder.none),

                            hint: const Text('اختر تصنيف الإجازة'),
                            // padding: const EdgeInsets.symmetric(horizontal: 20),
                            // underline: const Center(),
                            validator: (value) =>
                                value == null ? 'اختر التصنيف' : null,
                            items: LeaveType.values
                                .map((e) => DropdownMenuItem(

                                      value: e.name,
                                      child: Text(e.name),
                                    ))
                                .toList(),
                            value: bloc.type,
                            onChanged: (value) => changeState(() {
                              bloc.type = value;
                            }),
                          ),
                        ),
                        10.ph,
                        TextFormField(
                          controller: bloc.notesCtrl,
                          expands: false,
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: 'الملاحظات (اختيارى)',
                              fillColor: theme.scaffoldBackgroundColor,
                              filled: true,
                              border: InputBorder.none),
                        ),
                        10.ph,
                        state is LeavesLoadingState
                            ? const ButtonIncdicator()
                            : SButton(
                                title: 'إرسال الطلب',
                                onTap: () {
                                  if (!formKey.currentState!.validate()) return;
                                  if (!bloc.validateLeaveForm) return;
                                  bloc.add(const RequestLeaveEvent());
                                },
                              )
                      ],
                    );
                  });
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
