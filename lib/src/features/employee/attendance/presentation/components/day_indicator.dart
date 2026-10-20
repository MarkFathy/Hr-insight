import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

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
          child: Shimmer.fromColors(
            baseColor: context.colors.surface,
            highlightColor: context.colors.primary.withValues(alpha: .3),
            period: const Duration(milliseconds: 400),
            child: const Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              elevation: 4,
              child: SizedBox.expand(),
            ),
          ),
        ),
      ],
    );
}
