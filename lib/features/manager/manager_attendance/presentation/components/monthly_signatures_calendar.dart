import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/presentation/components/day_indicator.dart';
import 'package:hr_app/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:hr_app/features/manager/manager_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/features/manager/manager_attendance/presentation/components/manager_day_widget.dart';
import 'package:intl/intl.dart';

class ManagerMonthlySignaturesCalendar extends StatefulWidget {
  final int? employeeId;
  const ManagerMonthlySignaturesCalendar({super.key, this.employeeId});

  @override
  State<ManagerMonthlySignaturesCalendar> createState() =>
      _ManagerMonthlySignaturesCalendarState();
}

class _ManagerMonthlySignaturesCalendarState
    extends State<ManagerMonthlySignaturesCalendar>
    with AutoConnectivityRestoreMixin {
  late final EventController _eventController;
  DateTime _currentMonth = DateTime.now();
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  static final DateTime _minMonth = DateTime(2020);
  static final DateTime _maxMonth = DateTime(2035);

  static const List<String> _weekDays = [
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];

  @override
  void initState() {
    super.initState();
    _eventController = EventController();
  }

  @override
  void onConnectivityRestored() {
    if (widget.employeeId != null && mounted) {
      context.read<ManagerAttendanceBloc>().add(
        LoadManagerAttendanceEvent(
          ManagerAttendanceParams(
            employeeId: widget.employeeId.toString(),
            date: _currentMonth,
          ),
        ),
      );
    }
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
        if (state is ManagerAttendanceStateError) {
          return AppErrorState(
            message: state.message,
            onRetry: widget.employeeId != null
                ? () => context.read<ManagerAttendanceBloc>().add(
                    LoadManagerAttendanceEvent(
                      ManagerAttendanceParams(
                        employeeId: widget.employeeId.toString(),
                        date: _currentMonth,
                      ),
                    ),
                  )
                : null,
          );
        }

        // Build an O(1) lookup map of attendance records with precomputed formatted times
        final attendanceMap = <String, _ManagerDayEntry>{};
        if (state is ManagerAttendanceStateLoaded &&
            state.attendance?.data != null) {
          for (final record in state.attendance!.data!) {
            if (record.date != null) {
              final attTime = record.attendanceTime != null
                  ? (AttendanceDataEntity.formatServerTime(
                          time: record.attendanceTime,
                          date: record.date,
                          isoTimestamp: record.createdAt,
                        ) ??
                        record.attendanceTime)
                  : null;
              final depTime = record.departureTime != null
                  ? (AttendanceDataEntity.formatServerTime(
                          time: record.departureTime,
                          date: record.date,
                          isoTimestamp: record.updatedAt,
                        ) ??
                        record.departureTime)
                  : null;

              final existing = attendanceMap[record.date!];
              if (existing == null) {
                attendanceMap[record.date!] = _ManagerDayEntry(
                  data: record,
                  formattedAttendanceTime: attTime,
                  formattedDepartureTime: depTime,
                );
              } else {
                final mergedAtt = (attTime != null && attTime.isNotEmpty)
                    ? attTime
                    : existing.formattedAttendanceTime;
                final mergedDep = (depTime != null && depTime.isNotEmpty)
                    ? depTime
                    : existing.formattedDepartureTime;
                attendanceMap[record.date!] = _ManagerDayEntry(
                  data: (depTime != null && depTime.isNotEmpty)
                      ? record
                      : existing.data,
                  formattedAttendanceTime: mergedAtt,
                  formattedDepartureTime: mergedDep,
                );
              }
            }
          }
        }

        return MonthView(
          controller: _eventController,
          monthViewStyle: MonthViewStyle(
            showBorder: false,
            minMonth: _minMonth,
            maxMonth: _maxMonth,
            initialMonth: _currentMonth,
            useAvailableVerticalSpace: true,
            pagePhysics: const NeverScrollableScrollPhysics(),
            pageViewPhysics: const PageScrollPhysics(),
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
            weekDayBuilder: (day) => Material(
              color: colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: colors.primary)),
                  ),
                  child: Text(
                    _weekDays[day % _weekDays.length],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: typography.bodySmall,
                  ),
                ),
              ),
            ),
            cellBuilder:
                (date, events, isToday, isInMonth, hideDaysNotInMonth) {
                  if (!isInMonth) return const Center();

                  if (state is ManagerAttendanceStateLoading) {
                    return DayIndicator(day: date.day.toString());
                  }

                  final dateKey = _dateFormat.format(date);
                  final dayEntry = attendanceMap[dateKey];

                  return ManagerDayWidget(
                    key: ValueKey(dateKey),
                    date: date,
                    dayData: dayEntry?.data,
                    isToday: isToday,
                    formattedAttendanceTime: dayEntry?.formattedAttendanceTime,
                    formattedDepartureTime: dayEntry?.formattedDepartureTime,
                  );
                },
            onPageChange: (date, pageIndex) {
              _currentMonth = date;
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

class _ManagerDayEntry {
  final ManagerAttendanceDataEntity data;
  final String? formattedAttendanceTime;
  final String? formattedDepartureTime;

  const _ManagerDayEntry({
    required this.data,
    this.formattedAttendanceTime,
    this.formattedDepartureTime,
  });
}
