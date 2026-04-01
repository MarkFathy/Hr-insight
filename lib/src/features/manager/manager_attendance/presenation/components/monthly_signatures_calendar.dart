import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/components/day_indicator.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_block.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_event.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_state.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/components/manager_day_widget.dart';
import 'package:intl/intl.dart';

class ManagerMonthlySignaturesCalendar extends StatefulWidget {
  final int? employeeId;
  const ManagerMonthlySignaturesCalendar({
    Key? key,
    this.employeeId,
  }) : super(key: key);

  @override
  State<ManagerMonthlySignaturesCalendar> createState() =>
      _ManagerMonthlySignaturesCalendarState();
}

class _ManagerMonthlySignaturesCalendarState
    extends State<ManagerMonthlySignaturesCalendar> {
  DateTime signatureMonth = DateTime.now();
  String getWeekDay(int day) {
    final langIsEng = Localizations.localeOf(context).languageCode == 'en';
    switch (day) {
      case 0:
        return langIsEng ? "Mo" : 'الإثنين';
      case 1:
        return langIsEng ? "TU" : 'الثلاثاء';
      case 2:
        return langIsEng ? "We" : 'الأربعاء';
      case 3:
        return langIsEng ? "Th" : 'الخميس';
      case 4:
        return langIsEng ? "Fr" : 'الجمعة';
      case 5:
        return langIsEng ? "Sat" : 'السبت';
      case 6:
        return langIsEng ? "Sun" : 'الأحد';
      // break;
      default:
        return "Day";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerAttendanceBloc, ManagerAttendanceState>(
      builder: (context, state) {
        return MonthView(
          controller: EventController(),
          headerStyle: HeaderStyle(
              decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          )),
          weekDayBuilder: (day) {
            return Material(
                color: MyColors.greyColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor))),
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
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ));
          },
          cellBuilder: (date, events, isToday, isInMonth, hideDaysNotInMonth) {
            if (!isInMonth) return const Center();

            if (state is ManagerAttendanceStateLoading) {
              return DayIndicator(
                day: date.day.toString(),
              );
            } else if (state is ManagerAttendanceStateLoaded &&
                state.attendance!.data!.any((element) =>
                    element.date! == DateFormat('yyyy-MM-dd').format(date))) {
              return ManagerDayWidget(
                dayData: state.attendance!.data!.firstWhere((element) =>
                    element.date! == DateFormat('yyyy-MM-dd').format(date)),
                isToday: isToday,
                date: date,
              );
            } else {
              return ManagerDayWidget(
                date: date,
                isToday: isToday,
              );
            }
          },
          showBorder: false,
          minMonth: DateTime.now().subtract(const Duration(days: 3650)),
          maxMonth: DateTime.now().add(const Duration(days: 3650)),
          initialMonth: signatureMonth,
          cellAspectRatio: 3 / 8,
          onPageChange: (date, pageIndex) => {
            if (widget.employeeId != null)
              context.read<ManagerAttendanceBloc>().add(
                  LoadManagerAttendanceEvent(ManagerAttendanceParams(
                      employeeId: widget.employeeId.toString(), date: date))),
          },
          onCellTap: (events, date) {
            // print(events);
          },
          onEventTap: (event, date) {},
          onDateLongPress: (date) {},
        );
      },
    );
  }
}

//
class HeaderCard extends StatefulWidget {
  final Function(bool) turnPage;
  final DateTime date;
  const HeaderCard(
      {Key? key, required, required this.turnPage, required this.date})
      : super(key: key);

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              widget.turnPage(false);
              setState(() {});
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          Text(
            DateFormat('MM-yyyy').format(widget.date).toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              widget.turnPage(true);
              setState(() {});
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ]),
      ),
    );
  }
}
