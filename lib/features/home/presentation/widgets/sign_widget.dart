import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/shared/widgets/app_snack_bar.dart';
import 'package:hr_app/features/employee_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/features/home/presentation/widgets/attendance_confirmation_dialog.dart';
import 'package:hr_app/features/home/presentation/widgets/sign_action_box.dart';
import 'package:hr_app/features/home/presentation/widgets/sign_status_box.dart';
import 'package:hr_app/features/home/presentation/widgets/sign_times_card.dart';
import 'package:intl/intl.dart' as intl;

/// Top-level coordinator widget for employee attendance signing on the home screen.
class SignWidget extends StatelessWidget {
  const SignWidget({super.key});

  static final intl.DateFormat _dateFormatter = intl.DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is AttendanceSignedState) {
            showBar(state.message, context, isSuccess: true);
          } else if (state is AttendanceErrorState) {
            showBar(state.message, context, isError: true);
          }
        },
        buildWhen: (prev, curr) =>
            curr is AttendanceLoadingState ||
            curr is AttendanceLoadedState ||
            curr is AttendanceInitialState,
        builder: (context, state) {
          final bloc = context.read<AttendanceBloc>();
          final attendanceEntity = switch (state) {
            AttendanceLoadedState(:final attendance) => attendance,
            _ => bloc.attendance,
          };

          final todayRecord = attendanceEntity?.getTodayRecord();
          final isAttended = todayRecord != null;
          final depTimeStr = todayRecord?.departureTime?.trim();
          final isSignedOut =
              depTimeStr != null &&
              depTimeStr.isNotEmpty &&
              depTimeStr != 'null' &&
              depTimeStr != '00:00:00';
          final isLoading = state is AttendanceLoadingState;
          final hasData = attendanceEntity != null;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SignActionBox(
                        isAttended: isAttended,
                        isSignedOut: isSignedOut,
                        isLoading: isLoading,
                        onTap: () {
                          final todayStr = _dateFormatter.format(
                            DateTime.now(),
                          );
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
                      ),
                      SignStatusBox(
                        isAttended: isAttended,
                        isSignedOut: isSignedOut,
                        hasData: hasData,
                      ),
                    ],
                  ),
                ),
                if (todayRecord != null) ...[
                  const SizedBox(height: 12),
                  SignTimesCard(todayRecord: todayRecord),
                ],
              ],
            ),
          );
        },
      );
}
