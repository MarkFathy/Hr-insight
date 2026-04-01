import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/core/shared_widgets/search_fied.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/emplyee_card.dart';
import 'package:hr_app/src/injector.dart';

class EmployeesScreen extends StatelessWidget {
  static const routeName = '/employees';
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
      child: BlocConsumer<EmployeesBloc, EmployeesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<EmployeesBloc>();
          String query = '';
          return StatefulBuilder(builder: (context, changeState) {
            return Scaffold(
                appBar: AppBar(
                  title: const SText('الموظفين'),
                  leading: const SBackButton(),
                  centerTitle: true,
                  actions: const [],
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(50),
                      child: SearchField(
                        onChanged: (value) {
                          changeState(() => query = value!);
                        },
                        hint: 'اسم الموظف',
                      )),
                ),
                body: (state is EmployeesLoadedState &&
                        bloc.employees!.data!.isEmpty)
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 58.r),
                        child: const Text('لم يتم اضافة موظفين بعد'),
                      ))
                    : GridView(
                        padding: const EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.r,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        children: [
                            if (state is EmployeesLoadingState)
                              ...List.generate(
                                      10, (index) => const EmployeeIndicator())
                                  .toList(),
                            if (state is EmployeesLoadedState) ...[
                              if (state.employees.data!.isNotEmpty)
                                ...state.employees.data!
                                    .where((element) =>
                                        element.name!.startsWith(query))
                                    .map((e) => GestureDetector(
                                        child: EmployeeCard(employee: e))),
                            ],
                          ]));
          });
        },
      ),
    );
  }
}
