import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_back_button.dart';
import 'package:hr_app/core/widgets/app_error_state.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/features/employee/attendance/presentation/components/day_indicator.dart';
import 'package:hr_app/features/employee/attendance/presentation/components/day_widget.dart';
import 'package:intl/intl.dart';

class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({super.key});

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar>
    with AutoConnectivityRestoreMixin {
  DateTime _signatureMonth = DateTime.now();
  late final EventController _eventController;

  static final DateFormat _dayDateFormat = DateFormat('yyyy-MM-dd');
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
    if (mounted) {
      context.read<AttendanceBloc>().add(const GetAttendanceEvent());
    }
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('الحضور الشهري'),
      leading: const AppBackButton(),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'تحديث البيانات',
          onPressed: () => context.read<AttendanceBloc>().add(
            const GetAttendanceEvent(),
          ),
        ),
      ],
    ),
    body: BlocBuilder<AttendanceBloc, AttendanceState>(
      buildWhen: (prev, curr) =>
          curr is AttendanceLoadingState ||
          curr is AttendanceLoadedState ||
          curr is AttendanceErrorState,
      builder: (context, state) {
        if (state is AttendanceInitialState) {
          return const SizedBox.shrink();
        }
        if (state is AttendanceErrorState) {
          return RefreshIndicator(
            color: context.colors.primary,
            backgroundColor: context.colors.surface,
            onRefresh: () async {
              final bloc = context.read<AttendanceBloc>()
                ..add(const GetAttendanceEvent());
              await bloc.stream
                  .firstWhere(
                    (s) =>
                        s is AttendanceLoadedState ||
                        s is AttendanceErrorState,
                  )
                  .timeout(
                    const Duration(seconds: 15),
                    onTimeout: () => const AttendanceState.initial(),
                  );
            },
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: AppErrorState(
                    message: state.message,
                    onRetry: () => context.read<AttendanceBloc>().add(
                      const GetAttendanceEvent(),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        // Index attendance data into a map with pre-formatted times for O(1) cell lookups
        final attendanceMap = <String, _AttendanceDayEntry>{};
        if (state is AttendanceLoadedState && state.attendance.data != null) {
          for (final record in state.attendance.data!) {
            if (record.date != null) {
              attendanceMap[record.date!] = _AttendanceDayEntry(
                data: record,
                formattedAttendanceTime:
                    record.getAdjustedAttendanceTime() ?? record.attendanceTime,
                formattedDepartureTime:
                    record.getAdjustedDepartureTime() ?? record.departureTime,
              );
            }
          }
        }

        return MonthView(
          controller: _eventController,
          monthViewStyle: MonthViewStyle(
            showBorder: false,
            minMonth: _minMonth,
            maxMonth: _maxMonth,
            initialMonth: _signatureMonth,
            useAvailableVerticalSpace: true,
            hideDaysNotInMonth: true,
            pagePhysics: const NeverScrollableScrollPhysics(),
            pageViewPhysics: const PageScrollPhysics(),
            safeAreaOption: const SafeAreaOption(top: false),
          ),
          monthViewThemeSettings: MonthViewThemeSettings(
            headerStyle: HeaderStyle(
              leftIconConfig: IconDataConfig(
                color: context.colors.primary,
              ),
              rightIconConfig: IconDataConfig(
                color: context.colors.primary,
              ),
              decoration: BoxDecoration(
                color: context.colors.secondary,
              ),
              headerTextStyle: context.typography.titleLarge.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          monthViewBuilders: MonthViewBuilders(
            weekDayBuilder: (day) => Material(
              color: context.colors.surface,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    _weekDays[day % _weekDays.length],
                    style: context.typography.bodySmall,
                  ),
                ),
              ),
            ),
            cellBuilder:
                (date, events, isToday, isInMonth, hideDaysNotInMonth) {
                  if (!isInMonth) return const SizedBox.shrink();

                  if (state is AttendanceLoadingState) {
                    return DayIndicator(day: date.day.toString());
                  }

                  final dateKey = _dayDateFormat.format(date);
                  final dayEntry = attendanceMap[dateKey];

                  return DayWidget(
                    date: date,
                    dayData: dayEntry?.data,
                    formattedAttendanceTime: dayEntry?.formattedAttendanceTime,
                    formattedDepartureTime: dayEntry?.formattedDepartureTime,
                  );
                },
            onPageChange: (date, pageIndex) {
              _signatureMonth = date;
            },
            onCellTap: (events, date) {},
            onEventTap: (event, date) {},
            onDateLongPress: (date) {},
          ),
        );
      },
    ),
  );
}

class _AttendanceDayEntry {
  final AttendanceDataEntity data;
  final String? formattedAttendanceTime;
  final String? formattedDepartureTime;

  const _AttendanceDayEntry({
    required this.data,
    this.formattedAttendanceTime,
    this.formattedDepartureTime,
  });
}
