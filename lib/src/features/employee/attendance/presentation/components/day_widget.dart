/*import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final AttendanceDataEntity? dayData;
  const DayWidget({Key? key, required this.date, this.dayData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isToday =
        DateFormat('yyyy-MM-dd').format(date) ==
            DateFormat('yyyy-MM-dd').format(DateTime.now());
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
            elevation: 3,
            color: (!isToday)
                ? (dayData == null)
                    ? theme.colorScheme.secondary
                    : (dayData!.departureTime == null)
                        ? Colors.red
                        : theme.colorScheme.secondary
                : theme.colorScheme.primary.withOpacity(.3),
            child: Center(
              child: Text(
                date.day.toString(),
                style: theme.textTheme.labelLarge!
                    .copyWith(color: isToday ? null : theme.primaryColor),
              ),
            )),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(color: theme.colorScheme.secondary))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (dayData != null) ...[
                  if (dayData!.attendanceTime != null)
                    EntranceFader(
                        child: Column(
                      children: [
                        Text(
                          'الحضور',
                          style: theme.textTheme.labelSmall,
                        ),
                        Material(
                            elevation: 4,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                dayData!.attendanceTime!.substring(0, 5),
                                style: theme.textTheme.labelLarge,
                              ),
                            )),
                      ],
                    )),
                  const Divider(
                    height: 0,
                  ),
                  (dayData!.departureTime != null)
                      ? EntranceFader(
                          child: Column(
                          children: [
                            Text(
                              'الإنصراف',
                              style: theme.textTheme.labelSmall,
                            ),
                            Material(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Text(
                                    dayData!.departureTime!.substring(0, 5),
                                    style: theme.textTheme.labelLarge,
                                  ),
                                )),
                          ],
                        ))
                      : 15.ph,
                ]
              ],
            ),
          ),
        ),
        10.ph
      ],
    );
  }
}

*/



import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final AttendanceDataEntity? dayData;

  const DayWidget({Key? key, required this.date, this.dayData})
      : super(key: key);

  String _addHours(String time, int hours) {
    final timeFormat = DateFormat('HH:mm');
    final dateTime = timeFormat.parse(time);
    final updatedTime = dateTime.add(Duration(hours: hours));
    return timeFormat.format(updatedTime);
  }

  @override
  Widget build(BuildContext context) {
    final bool isToday =
        DateFormat('yyyy-MM-dd').format(date) ==
            DateFormat('yyyy-MM-dd').format(DateTime.now());
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(

            elevation: 3,
            color: (!isToday)
                ? (dayData == null)
                ? theme.colorScheme.secondary
                : (dayData!.departureTime == null)
                ? Colors.red
                : theme.colorScheme.secondary
                : theme.colorScheme.primary.withOpacity(.3),
            child: Center(
              child: Text(
                date.day.toString(),
                style: theme.textTheme.labelLarge!
                    .copyWith(color: isToday ? null : theme.primaryColor

                ),
              ),
            )),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(color: theme.colorScheme.secondary))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (dayData != null) ...[
                  if (dayData!.attendanceTime != null)
                    EntranceFader(
                        child: Column(
                          children: [
                            Text(
                              'الحضور',
                              style: theme.textTheme.labelSmall,
                            ),
                            Material(
                                elevation: 4,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Text(
                                    _addHours(dayData!.attendanceTime!, 3),
                                    style: theme.textTheme.labelLarge,
                                  ),
                                )),
                          ],
                        )),
                  const Divider(
                    height: 0,
                  ),
                  (dayData!.departureTime != null)
                      ? EntranceFader(
                      child: Column(
                        children: [
                          Text(
                            'الإنصراف',
                            style: theme.textTheme.labelSmall!.copyWith(color:Colors.green),
                          ),
                          Material(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2.0),
                                child: Text(
                                  _addHours(dayData!.departureTime!, 3),
                                  style: theme.textTheme.labelLarge,
                                ),
                              )),
                        ],
                      ))
                      : 15.ph,
                ]
              ],
            ),
          ),
        ),
        10.ph
      ],
    );
  }
}

