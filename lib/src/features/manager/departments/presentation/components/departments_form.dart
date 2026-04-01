import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/shared_widgets/button_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';

class DepartmentsForm extends StatelessWidget {
  final Function() rebuild;
  final DepartmentDataEntity? data;
  const DepartmentsForm({super.key, required this.rebuild, this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      child: BlocProvider(
        create: (context) => sl<DepartmentsAndJobsBloc>(),
        child: BlocConsumer<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
          listener: (context, state) {
            if (state is DepartmentsModifiedState) {
              rebuild();
              NV.pop(context);
            }
          },
          builder: (context, state) {
            final bloc = context.read<DepartmentsAndJobsBloc>();
            final formKey = GlobalKey<FormState>();
            if (data != null) {
              bloc.deptNameCtrl.text = data!.name!;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: theme.colorScheme.secondary,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10),
                        child: InkWell(
                          onTap: () => NV.pop(context),
                          child: Icon(
                            Icons.close_rounded,
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                      Text(data != null ? 'تعديل قسم' : 'إضافة قسم')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is DepartmentsErrorState)
                          Text(
                            state.message,
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: Colors.red),
                          ),
                        STextField(
                          lable: 'إسم القسم',
                          controller: bloc.deptNameCtrl..text,
                        ),
                        state is OfficesLoadingState
                            ? const ButtonIncdicator()
                            : SButton(
                                title: data != null ? 'تعديل' : 'إضافة',
                                onTap: () {
                                  if (!formKey.currentState!.validate()) return;

                                  bloc.add(data != null
                                      ? EditDepartmentEvent(id: data!.id!)
                                      : const AddDepartmentEvent());
                                })
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
