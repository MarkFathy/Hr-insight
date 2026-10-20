import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/components/day_indicator.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presentation/components/manager_day_widget.dart';
import 'package:intl/intl.dart';

class ManagerMonthlySignaturesCalendar extends StatefulWidget {
  final int? employeeId;
  const ManagerMonthlySignaturesCalendar({super.key, this.employeeId});

  @override
  State<ManagerMonthlySignaturesCalendar> createState() =>
      _ManagerMonthlySignaturesCalendarState();
}

class _ManagerMonthlySignaturesCalendarState
    extends State<ManagerMonthlySignaturesCalendar> {
  late final EventController _eventController;
  final DateTime _initialMonth = DateTime.now();
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _eventController = EventController();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return BlocBuilder<ManagerAttendanceBloc, ManagerAttendanceState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // Build an O(1) lookup map of attendance records by date string
        final attendanceMap = <String, ManagerAttendanceDataEntity>{};
        if (state is ManagerAttendanceStateLoaded &&
            state.attendance?.data != null) {
          for (final record in state.attendance!.data!) {
            if (record.date != null) {
              attendanceMap[record.date!] = record;
            }
          }
        }

        return MonthView(
          controller: _eventController,
          monthViewStyle: MonthViewStyle(
            showBorder: false,
            minMonth: DateTime.now().subtract(const Duration(days: 3650)),
            maxMonth: DateTime.now().add(const Duration(days: 3650)),
            initialMonth: _initialMonth,
            cellAspectRatio: 3 / 8,
          ),
          monthViewThemeSettings: MonthViewThemeSettings(
            headerStyle: HeaderStyle(
              leftIconConfig: IconDataConfig(color: colors.primary),
              rightIconConfig: IconDataConfig(color: colors.primary),
              decoration: BoxDecoration(color: colors.secondary),
              headerTextStyle: typography.titleLarge.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          monthViewBuilders: MonthViewBuilders(
            weekDayBuilder: (day) {
              const weekDays = [
                'الإثنين',
                'الثلاثاء',
                'الأربعاء',
                'الخميس',
                'الجمعة',
                'السبت',
                'الأحد',
              ];
              return Material(
                color: colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: colors.primary)),
                    ),
                    child: Text(
                      weekDays[day],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: typography.bodySmall,
                    ),
                  ),
                ),
              );
            },
            cellBuilder:
                (date, events, isToday, isInMonth, hideDaysNotInMonth) {
                  if (!isInMonth) return const Center();

                  if (state is ManagerAttendanceStateLoading) {
                    return DayIndicator(day: date.day.toString());
                  }

                  final dateKey = _dateFormat.format(date);
                  final dayRecord = attendanceMap[dateKey];

                  return ManagerDayWidget(
                    key: ValueKey(dateKey),
                    date: date,
                    dayData: dayRecord,
                    isToday: isToday,
                  );
                },
            onPageChange: (date, pageIndex) {
              if (widget.employeeId != null) {
                context.read<ManagerAttendanceBloc>().add(
                  LoadManagerAttendanceEvent(
                    ManagerAttendanceParams(
                      employeeId: widget.employeeId.toString(),
                      date: date,
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
