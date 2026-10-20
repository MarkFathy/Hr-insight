import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:intl/intl.dart';

class ManagerDayWidget extends StatelessWidget {
  final DateTime date;
  final ManagerAttendanceDataEntity? dayData;
  final bool isToday;

  const ManagerDayWidget({
    required this.date, super.key,
    this.dayData,
    this.isToday = false,
  });

  static final DateFormat _timeFormat = DateFormat('HH:mm');

  static String _addHours(String time, int hours) {
    try {
      final dateTime = _timeFormat.parse(time);
      final updatedTime = dateTime.add(Duration(hours: hours));
      return _timeFormat.format(updatedTime);
    } on FormatException catch (_) {
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isCurrentDay =
        date.year == now.year && date.month == now.month && date.day == now.day;

    final colors = context.colors;
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: 3,
          color: (!isCurrentDay)
              ? (dayData == null)
                    ? colors.secondary
                    : (dayData!.departureTime == null)
                    ? colors.error
                    : colors.secondary
              : colors.primary.withValues(alpha: .3),
          child: Center(
            child: Text(
              date.day.toString(),
              style: typography.labelLarge.copyWith(
                color: isCurrentDay ? null : colors.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: colors.secondary),
              ),
            ),
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
                            style: typography.labelSmall.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3.r),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                              ),
                              child: Text(
                                _addHours(dayData!.attendanceTime!, 3),
                                style: typography.labelLarge.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Divider(height: 0),
                  if (dayData!.departureTime != null)
                    EntranceFader(
                      child: Column(
                        children: [
                          Text(
                            'الإنصراف',
                            style: typography.labelSmall.copyWith(
                              color: colors.success,
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                              ),
                              child: Text(
                                _addHours(dayData!.departureTime!, 3),
                                style: typography.labelLarge.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    15.ph,
                ],
              ],
            ),
          ),
        ),
        10.ph,
      ],
    );
  }
}
