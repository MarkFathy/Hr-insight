import 'package:flutter/material.dart';
import 'package:hr_app/core/shared/widgets/app_button.dart';
import 'package:shimmer/shimmer.dart';

class ButtonIndicator extends StatelessWidget {
  const ButtonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.cardColor,
      highlightColor: theme.primaryColor,
      period: const Duration(milliseconds: 400),
      child: AppButton(title: 'جارى التحميل', onTap: () {}),
    );
  }
}
