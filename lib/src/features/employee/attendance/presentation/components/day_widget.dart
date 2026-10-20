import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final AttendanceDataEntity? dayData;

  static final DateFormat _timeFormat = DateFormat('HH:mm');

  const DayWidget({required this.date, super.key, this.dayData});

  String _addHours(String time, int hours) {
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
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: 3,
          color: (!isToday)
              ? (dayData == null)
                    ? context.colors.surface
                    : (dayData!.departureTime == null)
                    ? context.colors.error
                    : context.colors.surface
              : context.colors.primary.withValues(alpha: .3),
          child: Center(
            child: Text(
              date.day.toString(),
              style: context.typography.labelLarge.copyWith(
                color: isToday ? null : context.colors.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: context.colors.surface),
              ),
            ),
            child: dayData == null
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Expanded(
                        child: dayData!.attendanceTime != null
                            ? Padding(
                                padding: EdgeInsets.only(
                                  top: 6.h,
                                  bottom: 2.h,
                                ),
                                child: Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'الحضور',
                                        style: context.typography.labelSmall,
                                      ),
                                    ),
                                    2.ph,
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3.r),
                                        elevation: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                            vertical: 1.5.h,
                                          ),
                                          child: Text(
                                            _addHours(
                                              dayData!.attendanceTime!,
                                              3,
                                            ),
                                            style: context
                                                .typography
                                                .labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: context.colors.surface,
                      ),
                      Expanded(
                        child: dayData!.departureTime != null
                            ? Padding(
                                padding: EdgeInsets.only(
                                  bottom: 6.h,
                                  top: 2.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'الإنصراف',
                                        style: context.typography.labelSmall
                                            .copyWith(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    1.ph,
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.r),
                                          bottomRight: Radius.circular(5.r),
                                        ),
                                        elevation: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                            vertical: 1.5.h,
                                          ),
                                          child: Text(
                                            _addHours(
                                              dayData!.departureTime!,
                                              3,
                                            ),
                                            style: context
                                                .typography
                                                .labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
