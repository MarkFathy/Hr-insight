import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';

/// Displays the attendance check-in and departure timestamps in styled badges.
class SignTimesCard extends StatelessWidget {
  final AttendanceDataEntity todayRecord;

  const SignTimesCard({required this.todayRecord, super.key});

  @override
  Widget build(BuildContext context) {
    final depTimeStr = todayRecord.departureTime?.trim();
    final isSignedOut =
        depTimeStr != null &&
        depTimeStr.isNotEmpty &&
        depTimeStr != 'null' &&
        depTimeStr != '00:00:00';

    return Wrap(
      spacing: 10,
      runSpacing: 8,
      alignment: WrapAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: context.colors.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.primary.withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 16,
                color: context.colors.primary,
              ),
              8.pw,
              Text(
                'الحضور : ',
                style: context.typography.labelMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                ),
              ),
              Text(
                todayRecord.getAdjustedAttendanceTime(pattern: 'hh:mm:ss a') ??
                    '',
                textDirection: TextDirection.ltr,
                style: context.typography.labelMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
        if (isSignedOut)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.colors.success.withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout_rounded,
                  size: 16,
                  color: context.colors.success,
                ),
                8.pw,
                Text(
                  'الإنصراف : ',
                  style: context.typography.labelMedium.copyWith(
                    color: context.colors.success,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  todayRecord.getAdjustedDepartureTime(pattern: 'hh:mm:ss a') ??
                      '',
                  textDirection: TextDirection.ltr,
                  style: context.typography.labelMedium.copyWith(
                    color: context.colors.success,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
