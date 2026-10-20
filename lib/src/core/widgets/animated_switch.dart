import 'package:flutter/material.dart';

class AnimatedSwitch extends StatelessWidget {
  final Widget child;
  final bool isFadeTransition;
  final bool isVertic;
  const AnimatedSwitch({
    required this.child, super.key,
    this.isFadeTransition = false,
    this.isVertic = false,
  });

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: isFadeTransition ? 650 : 500),
      transitionBuilder: (child, animation) {
        final positionAnimation = Tween<Offset>(
          begin: isVertic ? const Offset(0.0, -1.0) : const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);
        return isFadeTransition
            ? FadeTransition(opacity: animation, child: child)
            : SlideTransition(position: positionAnimation, child: child);
      },
      child: child,
    );
}
