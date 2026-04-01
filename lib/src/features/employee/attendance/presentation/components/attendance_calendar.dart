import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
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
  DateTime signatureMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الحضور الشهرى'),
        centerTitle: true,
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          if (state is AttendanceInitialState) {
            return const Center();
          }
          if (state is AttendanceErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

          return MonthView(
            controller: EventController(),
            headerStyle: HeaderStyle(
                decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            )),
            weekDayBuilder: (day) {
              return Material(
                  color: MyColors.greyColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        [
                          'الإثنين',
                          'الثلاثاء',
                          'الأربعاء',
                          'الخميس',
                          'الجمعة',
                          'السبت',
                          'الأحد'
                        ][day],
                      ),
                    ),
                  ));
            },
            cellBuilder:
                (date, events, isToday, isInMonth, hideDaysNotInMonth) {
              if (!isInMonth) return const Center();
              if (state is AttendanceLoadingState) {
                return DayIndicator(
                  day: date.day.toString(),
                );
              } else if (state is AttendanceLoadedState &&
                  state.attendance.data!.any((element) => (element.date! ==
                      DateFormat('yyyy-MM-dd').format(date)))) {
                return DayWidget(
                  dayData: state.attendance.data!.firstWhere((element) =>
                      (element.date! == DateFormat('yyyy-MM-dd').format(date))),
                  date: date,
                );
              } else {
                return DayWidget(
                  date: date,
                );
              }
            },
            showBorder: false,
            minMonth: DateTime(2018),
            maxMonth: DateTime(2050),
            initialMonth: signatureMonth,
            cellAspectRatio: 3 / 8,
            onPageChange: (date, pageIndex) => {
              setState(() {
                signatureMonth = date;
              })
              // if (authState is UserVerified)
              // context.read<AttendanceBloc>().add(LoadAttendanceEvent()),
            },
            onCellTap: (events, date) {
              // print(events);
            },
            onEventTap: (event, date) {},
            onDateLongPress: (date) {},
          );
        },
      ),
    );
  }
}
