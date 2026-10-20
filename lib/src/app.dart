import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/routes/routes.dart';
import 'package:hr_app/src/core/theme/core_theme.dart';
import 'package:hr_app/src/features/home/splash_screen.dart';
import 'package:hr_app/src/localization/app_localizations.dart';

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
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
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
