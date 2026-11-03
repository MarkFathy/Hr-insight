import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/animated_switch.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/features/home/presentation/components/attendance_confirmation_dialog.dart';
import 'package:hr_app/features/home/presentation/components/clock_widget.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shimmer/shimmer.dart';

class SignWidget extends StatelessWidget {
  const SignWidget({super.key});

  static final intl.DateFormat _dateFormatter = intl.DateFormat('yyyy-MM-dd');

  @override
  Widget build(
    BuildContext context,
  ) => BlocConsumer<AttendanceBloc, AttendanceState>(
    listener: (context, state) {
      if (state is AttendanceSignedState) {
        showBar(state.message, context, isSuccess: true);
      }
      if (state is AttendanceErrorState) {
        showBar(state.message, context, isError: true);
      }
    },
    builder: (context, state) {
      final bloc = context.read<AttendanceBloc>();
      final now = DateTime.now();
      final todayStr = _dateFormatter.format(now);
      final attendanceList = bloc.attendance?.data;

      final todayRecords =
          attendanceList?.where((record) => record.date == todayStr).toList() ??
          [];

      AttendanceDataEntity? todayRecord;
      if (todayRecords.isNotEmpty) {
        AttendanceDataEntity? signedOutRecord;
        for (final r in todayRecords) {
          final dep = r.departureTime?.trim();
          if (dep != null &&
              dep.isNotEmpty &&
              dep != 'null' &&
              dep != '00:00:00') {
            signedOutRecord = r;
            break;
          }
        }

        if (signedOutRecord != null) {
          AttendanceDataEntity? recordWithAttendance;
          for (final r in todayRecords) {
            final att = r.attendanceTime?.trim();
            if (att != null && att.isNotEmpty && att != 'null') {
              recordWithAttendance = r;
              break;
            }
          }

          todayRecord = signedOutRecord.copyWith(
            attendanceTime:
                signedOutRecord.attendanceTime ??
                recordWithAttendance?.attendanceTime,
          );
        } else {
          todayRecord = todayRecords.last;
        }
      }

      final isAttended = todayRecord != null;
      final depTimeStr = todayRecord?.departureTime?.trim();
      final isSignedOut =
          depTimeStr != null &&
          depTimeStr.isNotEmpty &&
          depTimeStr != 'null' &&
          depTimeStr != '00:00:00';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Fingerprint Action Box
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      border: Border.all(
                        color: context.colors.primary,
                        width: 2,
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: (isAttended && isSignedOut)
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            child: Icon(
                              Icons.domain_verification_outlined,
                              color: Colors.black,
                              size: 52,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              if (state is AttendanceLoadingState) return;
                              unawaited(
                                AttendanceConfirmationDialog.show(
                                  context: context,
                                  isCheckIn: !isAttended,
                                  todayRecord: todayRecord,
                                  onConfirm: () {
                                    bloc.add(
                                      SignEvent(
                                        isAttend: !isAttended,
                                        attendanceId: todayRecord?.id,
                                        date: todayStr,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 12,
                              ),
                              child: AnimatedSwitch(
                                isFadeTransition: true,
                                child: state is AttendanceLoadingState
                                    ? Shimmer.fromColors(
                                        baseColor: Colors.black38,
                                        highlightColor: Colors.white,
                                        period: const Duration(
                                          milliseconds: 400,
                                        ),
                                        child: const Icon(
                                          Icons.fingerprint,
                                          color: Colors.black,
                                          size: 52,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.fingerprint,
                                        color: Colors.black,
                                        size: 52,
                                      ),
                              ),
                            ),
                          ),
                  ),
                  // Clock & Status Box
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                        ),
                        color: context.colors.surface,
                        border: Border.all(
                          color: context.colors.primary,
                          width: 2,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: (bloc.attendance != null)
                                  ? AnimatedSwitch(
                                      child: isAttended
                                          ? (isSignedOut
                                                ? Text(
                                                    'تم التسجيل',
                                                    key: const ValueKey('done'),
                                                    style: context
                                                        .typography
                                                        .titleMedium
                                                        .copyWith(
                                                          color: context
                                                              .colors
                                                              .success,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.5,
                                                        ),
                                                  )
                                                : Text(
                                                    'الإنصراف',
                                                    key: const ValueKey(
                                                      'depart',
                                                    ),
                                                    style: context
                                                        .typography
                                                        .titleMedium
                                                        .copyWith(
                                                          color: context
                                                              .colors
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.5,
                                                        ),
                                                  ))
                                          : Text(
                                              'الحضور',
                                              key: const ValueKey('attend'),
                                              style: context
                                                  .typography
                                                  .titleMedium
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.5,
                                                  ),
                                            ),
                                    )
                                  : Shimmer.fromColors(
                                      baseColor: Colors.transparent,
                                      highlightColor: context.colors.primary,
                                      child: Text(
                                        '--------',
                                        style: context.typography.titleMedium
                                            .copyWith(fontSize: 18.5),
                                      ),
                                    ),
                            ),
                            const Directionality(
                              textDirection: TextDirection.ltr,
                              child: ClockWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isAttended) ...[
              12.ph,
              Wrap(
                spacing: 10,
                runSpacing: 8,
                alignment: WrapAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
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
                          todayRecord.getAdjustedAttendanceTime(
                                pattern: 'hh:mm:ss a',
                              ) ??
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
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
                            todayRecord.getAdjustedDepartureTime(
                                  pattern: 'hh:mm:ss a',
                                ) ??
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
              ),
            ],
          ],
        ),
      );
    },
  );
}
