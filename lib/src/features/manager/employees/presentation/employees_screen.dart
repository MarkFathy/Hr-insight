import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/emplyee_card.dart';
import 'package:hr_app/src/injector.dart';

class EmployeesScreen extends StatelessWidget {
  static const routeName = '/employees';
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  preferredSize: Size.fromHeight(58.r),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 10.r),
                    child: TextField(
                      onChanged: (value) {
                        changeState(() => query = value);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.r,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.colorScheme.secondary,
                        hintText: 'بحث باسم الموظف...',
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 13.r,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.r,
                          vertical: 12.r,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: theme.primaryColor,
                          size: 20.r,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: theme.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: theme.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: theme.primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: (state is EmployeesLoadedState &&
                      bloc.employees!.data!.isEmpty)
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 58.r),
                        child: const Text('لم يتم اضافة موظفين بعد'),
                      ),
                    )
                  : GridView(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.05.r,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      children: [
                        if (state is EmployeesLoadingState)
                          ...List.generate(
                            10,
                            (index) => const EmployeeIndicator(),
                          ).toList(),
                        if (state is EmployeesLoadedState) ...[
                          if (state.employees.data!.isNotEmpty)
                            ...state.employees.data!
                                .where((element) =>
                                    element.name != null &&
                                    element.name!
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                .map((e) => GestureDetector(
                                      child: EmployeeCard(employee: e),
                                    )),
                        ],
                      ],
                    ),
            );
          });
        },
      ),
    );
  }
}
