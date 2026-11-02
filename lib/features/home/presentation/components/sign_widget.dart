import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/core/widgets/animated_switch.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
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
        context.read<AttendanceBloc>().add(const GetAttendanceEvent());
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
      AttendanceDataEntity? todayRecord;
      if (attendanceList != null) {
        for (final record in attendanceList) {
          if (record.date == todayStr) {
            todayRecord = record;
            break;
          }
        }
      }

      final isAttended = todayRecord != null;
      final isSignedOut = todayRecord?.departureTime != null;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      ),
                      border: Border.all(
                        color: context.colors.primary,
                        width: 2.w,
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: (isAttended && isSignedOut)
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 8.h,
                            ),
                            child: Icon(
                              Icons.domain_verification_outlined,
                              color: Colors.black,
                              size: 46.r,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              if (state is AttendanceLoadingState) return;
                              final actionText = isAttended
                                  ? 'الإنصراف'
                                  : 'الحضور';
                              final currentTimeText = intl.DateFormat.jms(
                                'ar',
                              ).format(DateTime.now());
                              unawaited(
                                showAdaptiveDialog<void>(
                                  context: context,
                                  builder: (ctx) => AlertDialog.adaptive(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    content: Text(
                                      'ستقوم بتسجيل $actionText\nالساعة الان $currentTimeText',
                                      style: context.typography.titleMedium
                                          .copyWith(
                                            color: context.colors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          bloc.add(
                                            const SignEvent(isAttend: true),
                                          );
                                          NavigationHelper.pop(ctx);
                                        },
                                        child: Text(
                                          'تسجيل',
                                          style: TextStyle(
                                            color: context.colors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            NavigationHelper.pop(ctx),
                                        child: Text(
                                          'إلغاء',
                                          style: TextStyle(
                                            color: context.colors.textSecondary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
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
                                        child: Icon(
                                          Icons.fingerprint,
                                          color: Colors.black,
                                          size: 46.r,
                                        ),
                                      )
                                    : Icon(
                                        Icons.fingerprint,
                                        color: Colors.black,
                                        size: 46.r,
                                      ),
                              ),
                            ),
                          ),
                  ),
                  // Clock & Status Box
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r),
                        ),
                        color: context.colors.surface,
                        border: Border.all(
                          color: context.colors.primary,
                          width: 2.w,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
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
                                                          fontSize: 16.sp,
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
                                                          fontSize: 16.sp,
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
                                                    fontSize: 16.sp,
                                                  ),
                                            ),
                                    )
                                  : Shimmer.fromColors(
                                      baseColor: Colors.transparent,
                                      highlightColor: context.colors.primary,
                                      child: Text(
                                        '--------',
                                        style: context.typography.titleMedium,
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
            if (isAttended && !isSignedOut) ...[
              8.ph,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: context.colors.surfaceContainer,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: context.colors.primary.withValues(alpha: 0.35),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14.r,
                      color: context.colors.primary,
                    ),
                    6.pw,
                    Text(
                      'الحضور : ',
                      style: context.typography.labelMedium.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        todayRecord.getAdjustedAttendanceTime(
                              pattern: 'hh:mm:ss a',
                            ) ??
                            '',
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.typography.labelMedium.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      );
    },
  );
}
