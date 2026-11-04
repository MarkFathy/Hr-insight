import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceLiveClock extends StatefulWidget {
  final bool isCheckIn;
  final String? checkInTime;

  const AttendanceLiveClock({
    required this.isCheckIn,
    super.key,
    this.checkInTime,
  });

  @override
  State<AttendanceLiveClock> createState() => _AttendanceLiveClockState();
}

class _AttendanceLiveClockState extends State<AttendanceLiveClock> {
  late DateTime _currentTime;
  Timer? _ticker;

  static final intl.DateFormat _timeFormatter = intl.DateFormat('hh:mm:ss');
  static final intl.DateFormat _periodFormatter = intl.DateFormat('a', 'ar');
  static final intl.DateFormat _fullDateFormatter = intl.DateFormat(
    'EEEE، d MMMM yyyy',
    'ar',
  );

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() => _currentTime = DateTime.now());
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final themeColor = widget.isCheckIn ? colors.primary : colors.warning;

    final timeStr = _timeFormatter.format(_currentTime);
    final periodStr = _periodFormatter.format(_currentTime);
    final dateStr = _fullDateFormatter.format(_currentTime);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          // Digital Time Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                timeStr,
                textDirection: TextDirection.ltr,
                style: typography.h1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  letterSpacing: 1.5,
                ),
              ),
              8.pw,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: themeColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  periodStr,
                  style: typography.labelSmall.copyWith(
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          6.ph,

          // Arabic Full Date
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_rounded,
                size: 13,
                color: colors.textTertiary,
              ),
              6.pw,
              Text(
                dateStr,
                style: typography.caption.copyWith(
                  color: colors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // Additional Info for Check-out
          if (!widget.isCheckIn && widget.checkInTime != null) ...[
            10.ph,
            Divider(color: colors.divider, height: 1),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 14,
                  color: colors.success,
                ),
                6.pw,
                Text(
                  'تم تسجيل الحضور الساعة:',
                  style: typography.caption.copyWith(
                    color: colors.textSecondary,
                    fontSize: 11,
                  ),
                ),
                4.pw,
                Text(
                  widget.checkInTime!,
                  textDirection: TextDirection.ltr,
                  style: typography.labelSmall.copyWith(
                    color: colors.success,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
