import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final AttendanceDataEntity? dayData;

  const DayWidget({required this.date, super.key, this.dayData});

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
                            ? Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 2.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'الحضور',
                                          style: context.typography.labelSmall,
                                        ),
                                        1.ph,
                                        _TimeBadge(
                                          formattedTime:
                                              dayData!
                                                  .getAdjustedAttendanceTime() ??
                                              dayData!.attendanceTime!,
                                          accentColor: context.colors.secondary,
                                        ),
                                      ],
                                    ),
                                  ),
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
                            ? Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 2.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'الإنصراف',
                                          style: context.typography.labelSmall
                                              .copyWith(
                                                color: context.colors.success,
                                              ),
                                        ),
                                        1.ph,
                                        _TimeBadge(
                                          formattedTime:
                                              dayData!
                                                  .getAdjustedDepartureTime() ??
                                              dayData!.departureTime!,
                                          accentColor: context.colors.success,
                                        ),
                                      ],
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
      ],
    );
  }
}

class _TimeBadge extends StatelessWidget {
  final String formattedTime;
  final Color accentColor;

  const _TimeBadge({required this.formattedTime, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    final parts = formattedTime.trim().split(' ');
    final timePart = parts.first;
    final periodPart = parts.length > 1 ? parts.last : '';

    return Material(
      color: Colors.white,
      borderRadius: context.radius.xsBorder,
      elevation: 2,
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
