import 'package:flutter/material.dart';
import 'package:hr_app/src/core/shared_widgets/s_button.dart';
import 'package:shimmer/shimmer.dart';

class ButtonIncdicator extends StatelessWidget {
  const ButtonIncdicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
        baseColor: theme.cardColor,
        highlightColor: theme.primaryColor,
        period: const Duration(milliseconds: 400),
        child: SButton(title: 'جارى التحميل', onTap: () {}));
  }
}
