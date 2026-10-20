import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/core/widgets/app_error_state.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/components/day_indicator.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/components/day_widget.dart';
import 'package:intl/intl.dart';

class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({super.key});

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  DateTime _signatureMonth = DateTime.now();
  late final EventController _eventController;

  static final DateFormat _dayDateFormat = DateFormat('yyyy-MM-dd');

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
      ),
      body: RefreshIndicator(
        color: context.colors.primary,
        backgroundColor: context.colors.surface,
        notificationPredicate: (notification) =>
            notification.metrics.axis == Axis.vertical,
        onRefresh: () async {
          final bloc = context.read<AttendanceBloc>()
            ..add(const GetAttendanceEvent());
          await bloc.stream
              .firstWhere(
                (state) =>
                    state is AttendanceLoadedState ||
                    state is AttendanceErrorState,
              )
              .timeout(
                const Duration(seconds: 15),
                onTimeout: () => const AttendanceState.initial(),
              );
        },
        child: BlocBuilder<AttendanceBloc, AttendanceState>(
          buildWhen: (prev, curr) =>
              curr is AttendanceLoadingState ||
              curr is AttendanceLoadedState ||
              curr is AttendanceErrorState,
          builder: (context, state) {
            if (state is AttendanceInitialState) {
              return const SizedBox.shrink();
            }
            if (state is AttendanceErrorState) {
              return LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: AppErrorState(
                      message: state.message,
                      onRetry: () => context
                          .read<AttendanceBloc>()
                          .add(const GetAttendanceEvent()),
                    ),
                  ),
                ),
              );
            }

            // Index attendance data into a map for O(1) day-cell lookups
            final attendanceMap = <String, AttendanceDataEntity>{};
            if (state is AttendanceLoadedState && state.attendance.data != null) {
              for (final record in state.attendance.data!) {
                if (record.date != null) {
                  attendanceMap[record.date!] = record;
                }
              }
            }

            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: MonthView(
                    controller: _eventController,
                    monthViewStyle: MonthViewStyle(
                      showBorder: false,
                      minMonth: DateTime(2018),
                      maxMonth: DateTime(2050),
                      initialMonth: _signatureMonth,
                      useAvailableVerticalSpace: true,
                      hideDaysNotInMonth: true,
                      pagePhysics: const NeverScrollableScrollPhysics(),
                      safeAreaOption: const SafeAreaOption(
                        top: false,
                      ),
                    ),
                    monthViewThemeSettings: MonthViewThemeSettings(
                      headerStyle: HeaderStyle(
                        leftIconConfig:
                            IconDataConfig(color: context.colors.primary),
                        rightIconConfig:
                            IconDataConfig(color: context.colors.primary),
                        decoration:
                            BoxDecoration(color: context.colors.secondary),
                        headerTextStyle:
                            context.typography.titleLarge.copyWith(
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
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              _weekDays[day % _weekDays.length],
                              style: context.typography.bodySmall,
                            ),
                          ),
                        ),
                      ),
                      cellBuilder: (
                        date,
                        events,
                        isToday,
                        isInMonth,
                        hideDaysNotInMonth,
                      ) {
                        if (!isInMonth) return const SizedBox.shrink();

                        if (state is AttendanceLoadingState) {
                          return DayIndicator(day: date.day.toString());
                        }

                        final dateKey = _dayDateFormat.format(date);
                        final dayData = attendanceMap[dateKey];

                        return DayWidget(date: date, dayData: dayData);
                      },
                      onPageChange: (date, pageIndex) {
                        setState(() {
                          _signatureMonth = date;
                        });
                      },
                      onCellTap: (events, date) {},
                      onEventTap: (event, date) {},
                      onDateLongPress: (date) {},
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
}
