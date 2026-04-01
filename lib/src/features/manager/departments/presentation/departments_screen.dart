import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/core/shared_widgets/app_indicator.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/s_text_field.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/departments_card.dart';
import 'package:hr_app/src/injector.dart';

class DepartmentsScreen extends StatelessWidget {
  static const routeName = '/departments';
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool modifing = false;
    // final theme = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          sl<DepartmentsAndJobsBloc>()..add(const GetDepartmentsAndJobsEvent()),
      child: BlocConsumer<DepartmentsAndJobsBloc, DepartmentsAndJobsState>(
        listener: (context, state) {
          if (state is DepartmentsLoadingState) modifing = false;
          if (state is DepartmentsErrorState) showBar(state.message, context);
        },
        builder: (context, state) {
          final bloc = context.read<DepartmentsAndJobsBloc>();
          return StatefulBuilder(builder: (context, changeState) {
            return Scaffold(
                appBar: AppBar(
                  title: const SText('الأقسام و الوظائف'),
                  leading: const SBackButton(),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () async {
                          // await showDialog(
                          //   context: context,
                          //   builder: (context) => DepartmentsForm(
                          //     rebuild: () {
                          //       bloc.add(const GetDepartmentsAndJobsEvent());
                          //     },
                          //   ),
                          // );
                          changeState(() => modifing = !modifing);
                        },
                        icon: Icon(
                          modifing ? Icons.close : Icons.add,
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedSwitch(
                          isVertic: true,
                          child: modifing
                              ? Material(
                            color: MyColors.greyColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text('اضافة قسم'),
                                        10.ph,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Form(
                                                key: bloc.deptFormKey,
                                                child: STextField(
                                                    lable: 'اسم القسم',
                                                    controller:
                                                        bloc.deptNameCtrl),
                                              ),
                                            ),
                                            state is DepartmentsLoadingState
                                                ? const AppIndicator()
                                                : InkWell(
                                                    onTap: () {
                                                      if (!bloc.deptFormKey
                                                          .currentState!
                                                          .validate()) return;

                                                      bloc.add(
                                                          const AddDepartmentEvent());
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          Icon(Icons.done_all),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const Center(),
                        ),
                        if (state is DepartmentsLoadedState &&
                            state.departments.data!.isEmpty)
                          Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 58.r),
                            child: const Text('لم يتم اضافة أقسام بعد'),
                          )),
                        if (state is DepartmentsLoadingState &&
                            bloc.departments == null)
                          ...List.generate(
                                  20, (index) => const DepartmentsIndicator())
                              .toList(),
                        if (state is DepartmentsLoadingState &&
                            bloc.departments != null)
                          const LinearProgressIndicator(),
                        if (state is DepartmentsLoadedState ||
                            bloc.departments != null) ...[
                          if (bloc.departments!.data!.isNotEmpty)
                            ...bloc.departments!.data!.map((e) => Material(
                              color:MyColors.greyColor,
                                  child: DepartmentCard(department: e),
                                )),
                        ],
                      ]),
                ));
          });
        },
      ),
    );
  }
}
