import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_text.dart';

class SButton extends StatelessWidget {
  final bool outlined;
  final String title;
  final Function() onTap;
  const SButton(
      {super.key,
      this.outlined = false,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 10.r),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 47.r),
          // fixedSize: Size(double.infinity, 75.r),
          backgroundColor: outlined ? Colors.transparent : theme.primaryColor,
          elevation: outlined ? 0 : null,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(
                  color: outlined ? theme.primaryColor : Colors.transparent)),
        ),
        child: SText(
          title,
          lightBg: outlined,
        ),
      ),
    );
  }
}
