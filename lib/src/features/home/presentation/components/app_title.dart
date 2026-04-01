import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/google_fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'HR\nINSIGHT',
      textAlign: TextAlign.end,
      style: safeGoogleFont('Tektur',
          fontSize: 37.r,
          color: theme.primaryColor,
          fontWeight: FontWeight.w900,
          shadows: const [Shadow(blurRadius: 12, offset: Offset(0, 0))],
          letterSpacing: 5),
    );
  }
}
