import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

class ManagerDayWidget extends StatelessWidget {
  final DateTime date;
  final ManagerAttendanceDataEntity? dayData;
  final bool isToday;
  const ManagerDayWidget(
      {Key? key, required this.date, this.dayData, this.isToday = false})
      : super(key: key);
  String _addHours(String time, int hours) {
    final timeFormat = DateFormat('HH:mm');
    final dateTime = timeFormat.parse(time);
    final updatedTime = dateTime.add(Duration(hours: hours));
    return timeFormat.format(updatedTime);
  }

  @override
  Widget build(BuildContext context) {
    final bool isToday = DateFormat('yyyy-MM-dd').format(date) ==
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
                          style: theme.textTheme.labelSmall!
                              .copyWith(color:Colors.white),
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
                              style: theme.textTheme.labelSmall!
                                  .copyWith(color:Colors.green),
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

        // if (dayData != null && dayData!.date!.day != DateTime.parse(todaySignature == null ? DateFormat('yyyy-MM-dd').format(DateTime.now()) : todaySignature.Date!).day)
        // Expanded(
        //   child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //     FittedBox(
        //       child: Text(
        //         dayData!.attendance. != null ? DateFormat('HH:mm').format(dayData!.firstpresenceTime!) : '1st P',
        //         maxLines: 1,
        //         // style: textTheme (context).titleMedium!.copyWith(fontWeight: FontWeight.bold),
        //         // style: Theme.of(context).textTheme.caption,
        //       ),
        //     ),
        //     FittedBox(
        //       child: Text(
        //         dayData!.firstdepartureTime != null ? DateFormat('HH:mm').format(dayData!.firstdepartureTime!) : '1st D',
        //         maxLines: 1,
        //         // style: TextStyle(fontWeight: FontWeight.bold, color: date.isBefore(DateTime.now()) && dayData!.firstdepartureTime == null ? Colors.orange : null),
        //       ),
        //     ),
        //     // FittedBox(
        //     //   child: Text(
        //     //     dayData!.secondpresenceTime != null ? DateFormat('HH:mm').format(dayData!.secondpresenceTime!) : '2nd P',
        //     //     maxLines: 1,
        //     //     // style: const TextStyle(fontWeight: FontWeight.bold),
        //     //   ),
        //     // ),
        //     // FittedBox(
        //     //   child: Text(
        //     //     dayData!.seconddepartureTime != null ? DateFormat('HH:mm').format(dayData!.seconddepartureTime!) : '2nd D',
        //     //     maxLines: 1,
        //     //     // style: TextStyle(fontWeight: FontWeight.bold, color: date.isBefore(DateTime.now()) && dayData!.seconddepartureTime == null ? Colors.redAccent.shade400 : null),
        //     //   ),
        //     // ),
        //   ]),
        // ),
        // if (isToday && todaySignature != null)
        //   Expanded(
        //     child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //       FittedBox(
        //         child: Text(
        //           todaySignature.FirstpresenceTime != null ? todaySignature.FirstpresenceTime!.substring(10, 16) : '1st P',
        //           maxLines: 1,
        //           style: TextStyle(fontWeight: FontWeight.bold, color: todaySignature.FirstpresenceTime != null ? Colors.green : Colors.redAccent.shade400),
        //           // style: Theme.of(context).textTheme.caption,
        //         ),
        //       ),
        //       FittedBox(
        //         child: Text(
        //           todaySignature.FirstdepartureTime != null ? todaySignature.FirstdepartureTime!.substring(10, 16) : '1st D',
        //           maxLines: 1,
        //           // style: TextStyle(fontWeight: FontWeight.bold, color: signatureData.today_signature!.FirstdepartureTime != null ? Colors.green : Colors.redAccent.shade400),
        //           // style: Theme.of(context).textTheme.caption,
        //         ),
        //       ),
        //       FittedBox(
        //         child: Text(
        //           todaySignature.SeconddepartureTime != null ? todaySignature.SecondpresenceTime!.substring(10, 16) : '2nd P',
        //           maxLines: 1,
        //           // style: TextStyle(fontWeight: FontWeight.bold, color: signatureData.today_signature!.SeconddepartureTime != null ? Colors.green : Colors.redAccent.shade400),
        //         ),
        //       ),
        //       FittedBox(
        //         child: Text(
        //           todaySignature.SeconddepartureTime != null ? todaySignature.SeconddepartureTime!.substring(10, 16) : '2nd D',
        //           maxLines: 1,
        //           // style: TextStyle(fontWeight: FontWeight.bold, color: signatureData.today_signature!.SeconddepartureTime != null ? Colors.green : Colors.redAccent.shade400),
        //         ),
        //       ),
        //     ]),
        //   ),
      ],
    );
  }
}
