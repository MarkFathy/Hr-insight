import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/context_extensions.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) => Text(
      'HR\nINSIGHT',
      textAlign: TextAlign.end,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 28.sp,
        height: 1.15,
        color: context.colors.primary,
        fontWeight: FontWeight.w900,
        shadows: const [Shadow(blurRadius: 10)],
        letterSpacing: 4,
      ),
    );
}
