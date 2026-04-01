import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

const _defaultTransition = PageTransitionType.rightToLeftWithFade;
const _alignment = Alignment.center;
const _duration = Duration(milliseconds: 400);

class NV {
  static Future<void> nextScreen(context, page) {
    return Navigator.push(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition));
  }

  static Future<void> nextScreenOS(context, page) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => page));
  }

  static void pop(context) {
    Navigator.pop(context);
  }

  static Future<void> nextScreenCloseOthers(context, page) {
    return Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition),
        (route) => false);
  }

  static Future<void> nextScreenReplace(context, page) {
    return Navigator.pushReplacement(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition));
  }

  // Named

  static Future<void> nextScreenNamed(context, routeName, {args}) {
    return Navigator.pushNamed(context, routeName, arguments: args);
  }

  static Future<void> nextScreenOSNamed(context, routeName, args) {
    return Navigator.pushNamed(context, routeName, arguments: args);
  }

  static void nextScreenCloseOthersNamed(context, routeName) {
    Navigator.restorablePushNamedAndRemoveUntil(
        context, routeName, (route) => false);
  }

  static Future<void> nextScreenReplaceNamed(context, routeName, {args}) {
    return Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  static Future<void> nextScreenPopup(context, page) {
    return Navigator.push(
      context,
      PageTransition(
          child: page,
          duration: _duration,
          alignment: _alignment,
          type: _defaultTransition,
          fullscreenDialog: true),
    );
  }
}
