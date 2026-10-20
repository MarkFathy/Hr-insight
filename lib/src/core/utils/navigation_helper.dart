import 'package:flutter/cupertino.dart';

Route<T> _createTransitionRoute<T>(Widget page, {bool fullscreenDialog = false}) =>
    PageRouteBuilder<T>(
      fullscreenDialog: fullscreenDialog,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );

class NavigationHelper {
  static Future<T?> nextScreen<T>(BuildContext context, Widget page) =>
      Navigator.push<T>(context, _createTransitionRoute<T>(page));

  static Future<T?> nextScreenOS<T>(BuildContext context, Widget page) =>
      Navigator.push<T>(context, CupertinoPageRoute(builder: (context) => page));

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }

  static Future<T?> nextScreenCloseOthers<T>(
    BuildContext context,
    Widget page,
  ) =>
      Navigator.pushAndRemoveUntil<T>(
        context,
        _createTransitionRoute<T>(page),
        (route) => false,
      );

  static Future<T?> nextScreenReplace<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page,
  ) =>
      Navigator.pushReplacement<T, TO>(context, _createTransitionRoute<T>(page));

  static Future<T?> nextScreenNamed<T>(
    BuildContext context,
    String routeName, {
    Object? args,
  }) =>
      Navigator.pushNamed<T>(context, routeName, arguments: args);

  static Future<T?> nextScreenOSNamed<T>(
    BuildContext context,
    String routeName,
    Object? args,
  ) =>
      Navigator.pushNamed<T>(context, routeName, arguments: args);

  static void nextScreenCloseOthersNamed(
    BuildContext context,
    String routeName,
  ) {
    Navigator.restorablePushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );
  }

  static Future<T?> nextScreenReplaceNamed<
    T extends Object?,
    TO extends Object?
  >(BuildContext context, String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed<T, TO>(
        context,
        routeName,
        arguments: args,
      );

  static Future<T?> nextScreenPopup<T>(BuildContext context, Widget page) =>
      Navigator.push<T>(
        context,
        _createTransitionRoute<T>(page, fullscreenDialog: true),
      );
}
