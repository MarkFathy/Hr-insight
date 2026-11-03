import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/features/home/presentation/components/app_title.dart';
import 'package:hr_app/features/home/presentation/components/employee_grid.dart';
import 'package:hr_app/features/home/presentation/components/manager_grid.dart';
import 'package:hr_app/features/home/presentation/components/sign_widget.dart';

class HomeScreen extends StatefulWidget {
  final bool isEmployee;
  static const routeName = '/home';
  const HomeScreen({required this.isEmployee, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutoConnectivityRestoreMixin {
  AttendanceBloc? _attendanceBloc;

  @override
  void initState() {
    super.initState();
    if (widget.isEmployee) {
      _attendanceBloc = sl<AttendanceBloc>()..add(const GetAttendanceEvent());
    }
  }

  @override
  void onConnectivityRestored() {
    if (widget.isEmployee && mounted) {
      _attendanceBloc?.add(const GetAttendanceEvent());
    }
  }

  @override
  void dispose() {
    unawaited(_attendanceBloc?.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmployee = widget.isEmployee;
    final content = Builder(
      builder: (ctx) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: RefreshIndicator(
            color: ctx.colors.primary,
            backgroundColor: ctx.colors.surface,
            onRefresh: () async {
              if (isEmployee) {
                _attendanceBloc?.add(const GetAttendanceEvent());
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ResponsiveContainer(
                maxWidth: 680,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(child: AppTitle()),
                          14.pw,
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(AppImages.logo, height: 76),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: ctx.colors.primary.withValues(alpha: 0.5),
                        height: 20,
                        thickness: 1,
                      ),
                    ),
                    if (!isEmployee) ...[
                      14.ph,
                      const ManagerGrid(),
                    ],
                    if (isEmployee) ...[
                      20.ph,
                      const SignWidget(),
                      24.ph,
                      const EmployeeGrid(),
                    ],
                    // Spacing to clear floating navigation bar
                    120.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (isEmployee && _attendanceBloc != null) {
      return BlocProvider.value(value: _attendanceBloc!, child: content);
    }
    return content;
  }
}
