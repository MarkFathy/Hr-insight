import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/features/employee/attendance/presentation/components/attendance_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  static const routeName = '/attendance';
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with AutoConnectivityRestoreMixin {
  late final AttendanceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<AttendanceBloc>()..add(const GetAttendanceEvent());
  }

  @override
  void onConnectivityRestored() {
    _bloc.add(const GetAttendanceEvent());
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _bloc,
    child: const Scaffold(body: AttendanceCalendar()),
  );
}
