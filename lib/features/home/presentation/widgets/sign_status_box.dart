import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/animated_switch.dart';
import 'package:hr_app/features/home/presentation/widgets/clock_widget.dart';
import 'package:shimmer/shimmer.dart';

/// Shows the current shift state ('الحضور', 'الإنصراف', 'تم التسجيل') alongside the real-time clock.
class SignStatusBox extends StatelessWidget {
  final bool isAttended;
  final bool isSignedOut;
  final bool hasData;

  const SignStatusBox({
    required this.isAttended,
    required this.isSignedOut,
    required this.hasData,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          bottomLeft: Radius.circular(18),
        ),
        color: context.colors.surface,
        border: Border.all(color: context.colors.primary, width: 2),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: hasData
                  ? AnimatedSwitch(
                      child: isAttended
                          ? (isSignedOut
                                ? Text(
                                    'تم التسجيل',
                                    key: const ValueKey('done'),
                                    style: context.typography.titleMedium
                                        .copyWith(
                                          color: context.colors.success,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.5,
                                        ),
                                  )
                                : Text(
                                    'الإنصراف',
                                    key: const ValueKey('depart'),
                                    style: context.typography.titleMedium
                                        .copyWith(
                                          color: context.colors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.5,
                                        ),
                                  ))
                          : Text(
                              'الحضور',
                              key: const ValueKey('attend'),
                              style: context.typography.titleMedium.copyWith(
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
                        style: context.typography.titleMedium.copyWith(
                          fontSize: 18.5,
                        ),
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
  );
}
