import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:shimmer/shimmer.dart';

class DayIndicator extends StatelessWidget {
  final String day;
  const DayIndicator({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
            color: theme.colorScheme.secondary,
            child: Center(
              child: Text(
                day,
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColor),
              ),
            )),
        Expanded(
          child: Shimmer.fromColors(
              baseColor: theme.cardColor,
              highlightColor: theme.primaryColor,
              period: const Duration(milliseconds: 400),
              child: const Material(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                elevation: 4,
                child: SizedBox.expand(),
              )),
        ),
        10.ph
      ],
    );
  }
}
