import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AutoConnectivityRestoreMixin {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.delayed(const Duration(seconds: 2)).then((_) {
        if (mounted) {
          NavigationHelper.nextScreenCloseOthersNamed(context, '/routing');
        }
      }),
    );
  }

  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.logo, width: size.width * .4),
              LottieBuilder.asset(
                AppImages.lLoader,
                animate: true,
                width: size.width,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

typedef SplashScreen = SplashPage;
