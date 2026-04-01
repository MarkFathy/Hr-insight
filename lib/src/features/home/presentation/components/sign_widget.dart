import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/src/injector.dart';
import 'package:intl/intl.dart' as intl;
import 'package:one_clock/one_clock.dart';
import 'package:shimmer/shimmer.dart';

class SignWidget extends StatelessWidget {
  const SignWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => sl<AttendanceBloc>()..add(GetAttendanceEvent()),
      child: BlocConsumer<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is AttendanceSignedState) {
            showBar(state.message, context);
            context.read<AttendanceBloc>().add(GetAttendanceEvent());
          }
          if (state is AttendanceErrorState) {
            showBar(state.message, context);
          }
        },
        builder: (context, state) {
          final bloc = context.read<AttendanceBloc>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          border:
                          Border.all(color: theme.primaryColor, width: 3)),
                      clipBehavior: Clip.hardEdge,
                      child: (bloc.attendance != null &&
                          bloc.attendance!.data!.any((element) =>
                          element.date ==
                              intl.DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now())) &&
                          bloc.attendance!.data!
                              .firstWhere((element) =>
                          element.date ==
                              intl.DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()))
                              .departureTime !=
                              null)
                          ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.domain_verification_outlined,
                          color: theme.colorScheme.secondary,
                          size: 60.r,
                        ),
                      )
                          : InkWell(
                        onTap: () {
                          // print('object');
                          if (state is AttendanceLoadingState) return;
                          showAdaptiveDialog(
                              context: context,
                              builder: (ctx) => AlertDialog.adaptive(
                                content: Text(
                                    'ستقوم بتسجيل ${bloc.attendance!.data!.any((element) => element.date == intl.DateFormat('yyyy-MM-dd').format(DateTime.now())) ? "الإنصراف" : "الحضور"}\nالساعة الان ${intl.DateFormat.jms('ar').format(DateTime.now())},',
                                    style: theme.textTheme.labelLarge!
                                        .copyWith(color: theme.primaryColor)


                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        bloc.add(const SignEvent(
                                            isAttend: true));
                                        NV.pop(context);
                                      },
                                      child: const Text(
                                        "تسجيل",style: TextStyle(
                                          color: Colors.amberAccent
                                        ),
                                        )),
                                  TextButton(
                                    onPressed: () => NV.pop(context),
                                    child: const Text("إلغاء",
                                    style: TextStyle(
                                          color: Colors.amber
                                        ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: AnimatedSwitch(
                            isFadeTransition: true,
                            child: state is AttendanceLoadingState
                                ? Shimmer.fromColors(
                                baseColor: theme.cardColor,
                                highlightColor: theme.primaryColor,
                                period:
                                const Duration(milliseconds: 400),
                                child: Icon(
                                  Icons.fingerprint,
                                  color: theme.cardColor,
                                  size: 60.r,
                                ))
                                : Icon(
                              Icons.fingerprint,
                              color: theme.cardColor,
                              size: 60.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(12)),
                            color: theme.colorScheme.secondary,
                            border: Border.all(
                                color: theme.primaryColor, width: 3)),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              height: 50.r,
                              child: Center(
                                  child: (bloc.attendance != null)
                                      ? AnimatedSwitch(
                                    child: bloc.attendance!.data!.any((element) =>
                                    element.date ==
                                        intl.DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now()))
                                        ? bloc.attendance!.data!
                                        .firstWhere((element) =>
                                    element.date ==
                                        intl.DateFormat(
                                            'yyyy-MM-dd')
                                            .format(DateTime
                                            .now()))
                                        .departureTime !=
                                        null
                                        ? const Text('تم التسجيل',style: TextStyle(color:Colors.white),)
                                        : Text('الإنصراف',
                                      style: theme.textTheme
                                          .titleLarge!,

                                    )
                                        : Text(
                                      'الحضور',
                                      style: theme
                                          .textTheme.titleLarge!,

                                    ),
                                  )
                                      : Shimmer.fromColors(
                                      baseColor: Colors.transparent,
                                      highlightColor: theme.primaryColor,
                                      child: Text(
                                        '--------',
                                        style: theme.textTheme.titleLarge,
                                      ))),
                            ),
                            const Directionality(
                              textDirection: TextDirection.ltr,
                              child: ClockWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (bloc.attendance != null &&
                    bloc.attendance!.data!.any((element) =>
                    element.date ==
                        intl.DateFormat('yyyy-MM-dd').format(DateTime.now())))
                  Material(
                    color: MyColors.greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: bloc.attendance!.data!
                          .firstWhere((element) =>
                      element.date ==
                          intl.DateFormat('yyyy-MM-dd')
                              .format(DateTime.now()))
                          .departureTime !=
                          null
                          ? const Center()
                          : Text(
                        'الحضور :${bloc.attendance!.data!.firstWhere((element) => element.date == intl.DateFormat('yyyy-MM-dd').format(DateTime.now())).getAdjustedAttendanceTime()}',
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColor),
                      ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}



// Directionality(
//   textDirection: TextDirection.ltr,
//   child: DigitalClock(
//
//     is24HourTimeFormat: false,
//     showSecondsDigit: true,
//     areaHeight: 50.r,
//     hourMinuteDigitTextStyle: safeGoogleFont(
//         'PT Serif',
//         fontSize: 15.r,
//         fontWeight: FontWeight.bold,
//     color: Colors.white,
//     ),
//     amPmDigitTextStyle: safeGoogleFont('PT Serif',
//         fontSize: 15.r,
//         fontWeight: FontWeight.bold,
//       color: Colors.white,
//
//
//     ),
//
//   ),
// ),


class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DigitalClock(
        showSeconds: false,
        isLive: false,
        digitalClockTextColor: Colors.white,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        datetime: _currentTime,
      ),
    );
  }
}
