import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/components/attendance_calendar.dart';

class AttendanceScreen extends StatelessWidget {
  static const routeName = '/attendance';
  const AttendanceScreen({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => sl<AttendanceBloc>()..add(const GetAttendanceEvent()),
      child: const Scaffold(body: AttendanceCalendar()),
    );
}
