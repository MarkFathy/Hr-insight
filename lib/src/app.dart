import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/routes/routes.dart';
import 'package:hr_app/src/core/theme/core_theme.dart';
import 'package:hr_app/src/features/home/splash_screen.dart';
import 'package:hr_app/src/features/settings/settings_controller.dart';
import 'package:hr_app/src/features/settings/settings_view.dart';
import 'package:hr_app/src/localization/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'),
            ],
            locale: const Locale('ar'),
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: themeData,
            themeMode: ThemeMode.light,
            home: const SplashScreen(),
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  if (routeSettings.name == SettingsView.routeName) {
                    return SettingsView(controller: settingsController);
                  }
                  if (AppRoutes.routes.keys.contains(routeSettings.name)) {
                    return AppRoutes.routes[routeSettings.name]!;
                  }
                  return const SplashScreen();
                },
              );
            },
          );
        },
      ),
    );
  }
}
