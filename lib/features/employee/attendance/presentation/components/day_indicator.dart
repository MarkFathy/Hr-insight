import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/extensions.dart';

class DayIndicator extends StatelessWidget {
  final String day;
  const DayIndicator({required this.day, super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Material(
        color: context.colors.secondary,
        child: Center(
          child: Text(
            day,
            style: context.typography.labelLarge.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ),
      Expanded(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.surface.withValues(alpha: 0.4),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: const SizedBox.expand(),
        ),
      ),
    ],
  );
}
