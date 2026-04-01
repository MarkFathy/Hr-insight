import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:lottie/lottie.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({super.key, this.size = 50});
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: LottieBuilder.asset(
        AppImages.lEyeLoader,
      ),
    );
  }
}
