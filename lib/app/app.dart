import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_app/app/router/app_router.dart';
import 'package:hr_app/core/shared/widgets/internet_connection_wrapper.dart';
import 'package:hr_app/core/theme/core_theme.dart';
import 'package:hr_app/features/home/presentation/pages/splash_page.dart';
import 'package:hr_app/localization/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    restorationScopeId: 'app',
    debugShowCheckedModeBanner: false,
    builder: (context, child) =>
        InternetConnectionWrapper(child: child ?? const SizedBox.shrink()),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('ar'), Locale('en')],
    locale: const Locale('ar'),
    onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
    theme: themeData,
    themeMode: ThemeMode.light,
    home: const SplashPage(),
    onGenerateRoute: (routeSettings) => MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (context) => AppRouter.buildPage(routeSettings.name),
    ),
  );
}
