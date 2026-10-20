import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/core/widgets/app_empty_state.dart';
import 'package:hr_app/src/core/widgets/app_error_state.dart';
import 'package:hr_app/src/core/widgets/search_field.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_card.dart';

class EmployeesScreen extends StatefulWidget {
  static const routeName = '/employees';
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
    child: Builder(
      builder: (screenCtx) => Scaffold(
        appBar: AppBar(
          title: const Text('الموظفين'),
          leading: const AppBackButton(),
          leadingWidth: 64.w,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: SearchField(
                controller: _searchController,
                hintText: 'بحث باسم الموظف أو البريد...',
                onChanged: (value) {
                  setState(
                    () => _searchQuery = (value ?? '').trim().toLowerCase(),
                  );
                },
                onClear: () {
                  setState(() => _searchQuery = '');
                },
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          color: screenCtx.colors.primary,
          backgroundColor: screenCtx.colors.surface,
          onRefresh: () async {
            screenCtx.read<EmployeesBloc>().add(const GetEmployeesEvent());
          },
          child: BlocBuilder<EmployeesBloc, EmployeesState>(
            buildWhen: (prev, curr) =>
                curr is EmployeesLoadingState ||
                curr is EmployeesLoadedState ||
                curr is EmployeesErrorState,
            builder: (context, state) {
              if (state is EmployeesLoadingState) {
                return GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => const EmployeeIndicator(),
                );
              }

              if (state is EmployeesLoadedState) {
                final allEmployees = state.employees.data ?? [];
                if (allEmployees.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: const AppEmptyState(
                          icon: Icons.people_outline_rounded,
                          title: 'لم يتم إضافة موظفين بعد',
                          subtitle:
                              'يمكن للموظفين الانضمام باستخدام كود التسجيل الخاص بالمؤسسة',
                        ),
                      ),
                    ),
                  );
                }

                final filteredEmployees = _searchQuery.isEmpty
                    ? allEmployees
                    : allEmployees
                          .where(
                            (e) =>
                                (e.name != null &&
                                    e.name!.toLowerCase().contains(
                                      _searchQuery,
                                    )) ||
                                (e.email != null &&
                                    e.email!.toLowerCase().contains(
                                      _searchQuery,
                                    )),
                          )
                          .toList();

                if (filteredEmployees.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: AppEmptyState(
                          icon: Icons.search_off_rounded,
                          title: 'لا توجد نتائج مطابقة',
                          subtitle:
                              'لم نتمكن من العثور على أي موظف مطابق للبحث "$_searchQuery"',
                          actionLabel: 'مسح البحث',
                          actionIcon: Icons.clear_rounded,
                          onAction: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        ),
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 20.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                  ),
                  itemCount: filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employee = filteredEmployees[index];
                    return EmployeeCard(employee: employee);
                  },
                );
              }

              if (state is EmployeesErrorState) {
                return LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: AppErrorState(
                        message: state.message,
                        onRetry: () => screenCtx.read<EmployeesBloc>().add(
                          const GetEmployeesEvent(),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
  );
}
