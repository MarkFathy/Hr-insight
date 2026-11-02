import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/routes/routes.dart';
import 'package:hr_app/core/theme/core_theme.dart';
import 'package:hr_app/core/widgets/internet_connection_wrapper.dart';
import 'package:hr_app/features/home/splash_screen.dart';
import 'package:hr_app/localization/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    child: MaterialApp(
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
      home: const SplashScreen(),
      onGenerateRoute: (routeSettings) => MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (context) => AppRoutes.buildScreen(routeSettings.name),
      ),
    ),
  );
}
