import 'package:flutter/material.dart';

class AnimatedSwitch extends StatelessWidget {
  final Widget child;
  final bool isFadeTransition;
  final bool isVertic;

  const AnimatedSwitch({
    required this.child,
    super.key,
    this.isFadeTransition = false,
    this.isVertic = false,
  });

  static final _verticalTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  );

  static final _horizontalTween = Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  );

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: const Duration(milliseconds: 500),
    reverseDuration: Duration(milliseconds: isFadeTransition ? 650 : 500),
    transitionBuilder: (child, animation) => isFadeTransition
        ? FadeTransition(opacity: animation, child: child)
        : SlideTransition(
            position: (isVertic ? _verticalTween : _horizontalTween).animate(
              animation,
            ),
            child: child,
          ),
    child: child,
  );
}
