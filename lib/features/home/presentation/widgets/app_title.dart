import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/context_extensions.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) => Text(
    'HR\nINSIGHT',
    textAlign: TextAlign.end,
    style: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 30,
      height: 1.15,
      color: context.colors.primary,
      fontWeight: FontWeight.w900,
      shadows: const [Shadow(blurRadius: 10)],
      letterSpacing: 4.5,
    ),
  );
}
