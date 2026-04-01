import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/google_fonts.dart';

class SText extends StatelessWidget {
  final String txt;
  final bool lightBg;
  final bool isTitle;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  const SText(this.txt,
      {super.key,
      this.isTitle = false,
      this.lightBg = true,
      this.fontSize,
      this.color,
      this.maxLines,
      this.overflow
      
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      txt,
      maxLines: maxLines,
      overflow: overflow,
      style: safeGoogleFont(
        'Cairo',
        fontSize: isTitle ? fontSize ?? 32.r : fontSize ?? 16.r,
        fontWeight: FontWeight.w800,
        height: 1.2125.r,
        color: color ?? (lightBg ? theme.primaryColor : Colors.black),
        
      ),
    );
  }
}
