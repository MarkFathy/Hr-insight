import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceConfirmationDialog extends StatefulWidget {
  final bool isCheckIn;
  final VoidCallback onConfirm;
  final AttendanceDataEntity? todayRecord;

  const AttendanceConfirmationDialog({
    required this.isCheckIn,
    required this.onConfirm,
    super.key,
    this.todayRecord,
  });

  static Future<void> show({
    required BuildContext context,
    required bool isCheckIn,
    required VoidCallback onConfirm,
    AttendanceDataEntity? todayRecord,
  }) => showDialog<void>(
    context: context,
    builder: (ctx) => AttendanceConfirmationDialog(
      isCheckIn: isCheckIn,
      onConfirm: onConfirm,
      todayRecord: todayRecord,
    ),
  );

  @override
  State<AttendanceConfirmationDialog> createState() =>
      _AttendanceConfirmationDialogState();
}

class _AttendanceConfirmationDialogState
    extends State<AttendanceConfirmationDialog> {
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
    final isCheckIn = widget.isCheckIn;

    final actionTitle = isCheckIn ? 'تسجيل الحضور' : 'تسجيل الإنصراف';
    final actionSubtitle = isCheckIn
        ? 'تأكيد تسجيل حضورك اليومي في موقع العمل المعتمد'
        : 'تأكيد تسجيل انصرافك وانتهاء ساعات العمل اليومية';

    final themeColor = isCheckIn ? colors.primary : colors.warning;
    final actionIcon = isCheckIn ? Icons.login_rounded : Icons.logout_rounded;

    final timeStr = _timeFormatter.format(_currentTime);
    final periodStr = _periodFormatter.format(_currentTime);
    final dateStr = _fullDateFormatter.format(_currentTime);

    final checkInTime = widget.todayRecord?.getAdjustedAttendanceTime();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: themeColor.withValues(alpha: 0.35),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 28,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: themeColor.withValues(alpha: 0.08),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fingerprint Glowing Header Icon
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeColor.withValues(alpha: 0.12),
                        border: Border.all(
                          color: themeColor.withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeColor.withValues(alpha: 0.2),
                      ),
                      child: Icon(
                        Icons.fingerprint_rounded,
                        color: themeColor,
                        size: 38,
                      ),
                    ),
                  ],
                ),
              ),
              14.ph,

              // Action Badge Tag
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: themeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: themeColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(actionIcon, size: 13, color: themeColor),
                      5.pw,
                      Text(
                        actionTitle,
                        style: typography.labelSmall.copyWith(
                          color: themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.ph,

              // Title & Subtitle
              Text(
                'تأكيد بصمة $actionTitle',
                textAlign: TextAlign.center,
                style: typography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              6.ph,
              Text(
                actionSubtitle,
                textAlign: TextAlign.center,
                style: typography.caption.copyWith(
                  color: colors.textSecondary,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
              16.ph,

              // Live Digital Clock & Date Box
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.15),
                  ),
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
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
                    if (!isCheckIn && checkInTime != null) ...[
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
                            checkInTime,
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
              ),
              14.ph,

              // GPS Notice
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location_rounded,
                    size: 13,
                    color: colors.primary,
                  ),
                  6.pw,
                  Flexible(
                    child: Text(
                      'يتم التحقق من النطاق الجغرافي للمكتب (GPS) تلقائياً',
                      style: typography.caption.copyWith(
                        color: colors.textTertiary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              18.ph,

              // Action Buttons Row
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => NavigationHelper.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colors.textSecondary,
                          side: BorderSide(
                            color: colors.border.withValues(alpha: 0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'إلغاء',
                          style: typography.titleSmall.copyWith(
                            color: colors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  12.pw,

                  // Confirm Button
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          NavigationHelper.pop(context);
                          widget.onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          foregroundColor: Colors.black,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        icon: Icon(actionIcon, size: 18, color: Colors.black),
                        label: Text(
                          isCheckIn ? 'تأكيد الحضور' : 'تأكيد الإنصراف',
                          style: typography.titleSmall.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
