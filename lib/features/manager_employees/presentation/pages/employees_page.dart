import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/app/di/service_locator.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/app_back_button.dart';
import 'package:hr_app/core/shared/widgets/app_empty_state.dart';
import 'package:hr_app/core/shared/widgets/app_error_state.dart';
import 'package:hr_app/core/shared/widgets/search_field.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/manager_employees/presentation/bloc/employees_bloc.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/employee_card.dart';

class EmployeesPage extends StatefulWidget {
  static const routeName = '/employees';
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage>
    with AutoConnectivityRestoreMixin {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>('');
  late final EmployeesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<EmployeesBloc>()..add(const GetEmployeesEvent());
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(const GetEmployeesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchQuery.dispose();
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _bloc,
    child: Builder(
      builder: (screenCtx) => Scaffold(
        appBar: AppBar(
          title: const Text('الموظفين'),
          leading: const AppBackButton(),
          leadingWidth: 64,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: SearchField(
                controller: _searchController,
                hintText: 'بحث باسم الموظف أو البريد...',
                onChanged: (value) {
                  _searchQuery.value = (value ?? '').trim().toLowerCase();
                },
                onClear: () {
                  _searchQuery.value = '';
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => const EmployeeIndicator(),
                );
              }

              if (state is EmployeesLoadedState) {
                final allEmployees = state.employees.data ?? const [];
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

                return ValueListenableBuilder<String>(
                  valueListenable: _searchQuery,
                  builder: (context, query, _) {
                    final filteredEmployees = query.isEmpty
                        ? allEmployees
                        : allEmployees
                              .where(
                                (e) =>
                                    (e.name != null &&
                                        e.name!.toLowerCase().contains(
                                          query,
                                        )) ||
                                    (e.email != null &&
                                        e.email!.toLowerCase().contains(query)),
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
                                  'لم نتمكن من العثور على أي موظف مطابق للبحث "$query"',
                              actionLabel: 'مسح البحث',
                              actionIcon: Icons.clear_rounded,
                              onAction: () {
                                _searchController.clear();
                                _searchQuery.value = '';
                              },
                            ),
                          ),
                        ),
                      );
                    }

                    return GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.95,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                      itemCount: filteredEmployees.length,
                      itemBuilder: (context, index) {
                        final employee = filteredEmployees[index];
                        return EmployeeCard(employee: employee);
                      },
                    );
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

typedef EmployeesScreen = EmployeesPage;
