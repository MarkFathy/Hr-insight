import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/entrance_fader.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';
import 'package:intl/intl.dart' as intl;

class ManagerDayWidget extends StatelessWidget {
  final DateTime date;
  final ManagerAttendanceDataEntity? dayData;
  final bool isToday;

  const ManagerDayWidget({
    required this.date,
    super.key,
    this.dayData,
    this.isToday = false,
  });

  static final intl.DateFormat _dateFormat = intl.DateFormat('yyyy-MM-dd');

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
            child: dayData == null
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Expanded(
                        child: dayData!.attendanceTime != null
                            ? Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 2.h,
                                    ),
                                    child: EntranceFader(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'الحضور',
                                            style: typography.labelSmall
                                                .copyWith(color: Colors.white),
                                          ),
                                          1.ph,
                                          _ManagerTimeBadge(
                                            formattedTime:
                                                AttendanceDataEntity.formatServerTime(
                                                  time: dayData!.attendanceTime,
                                                  date:
                                                      dayData!.date ??
                                                      _dateFormat.format(date),
                                                  isoTimestamp:
                                                      dayData!.createdAt,
                                                ) ??
                                                dayData!.attendanceTime!,
                                            accentColor: colors.secondary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const Divider(height: 1, thickness: 0.5),
                      Expanded(
                        child: dayData!.departureTime != null
                            ? Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 2.h,
                                    ),
                                    child: EntranceFader(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'الإنصراف',
                                            style: typography.labelSmall
                                                .copyWith(
                                                  color: colors.success,
                                                ),
                                          ),
                                          1.ph,
                                          _ManagerTimeBadge(
                                            formattedTime:
                                                AttendanceDataEntity.formatServerTime(
                                                  time: dayData!.departureTime,
                                                  date:
                                                      dayData!.date ??
                                                      _dateFormat.format(date),
                                                  isoTimestamp:
                                                      dayData!.updatedAt,
                                                ) ??
                                                dayData!.departureTime!,
                                            accentColor: colors.success,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
          ),
        ),
        10.ph,
      ],
    );
  }
}

class _ManagerTimeBadge extends StatelessWidget {
  final String formattedTime;
  final Color accentColor;

  const _ManagerTimeBadge({
    required this.formattedTime,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final parts = formattedTime.trim().split(' ');
    final timePart = parts.first;
    final periodPart = parts.length > 1 ? parts.last : '';

    return Material(
      color: Colors.white,
      borderRadius: context.radius.xsBorder,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timePart,
              textDirection: TextDirection.ltr,
              maxLines: 1,
              softWrap: false,
              style: context.typography.labelMedium.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
            if (periodPart.isNotEmpty)
              Text(
                periodPart,
                textDirection: TextDirection.ltr,
                maxLines: 1,
                softWrap: false,
                style: context.typography.caption.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 9.sp,
                  height: 1.0,
                  letterSpacing: 0.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
