import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/constants/app_constants.dart';
import 'package:hr_app/localization/app_localizations.dart';

/// Semantic color tokens for the app theme.
class AppColors {
  final BuildContext _context;
  const AppColors(this._context);

  ThemeData get _theme => Theme.of(_context);
  ColorScheme get _scheme => _theme.colorScheme;

  Color get primary => _theme.primaryColor;
  Color get primaryLight => MyColors.primaryLight;
  Color get secondary => _scheme.secondary;
  Color get background => _theme.scaffoldBackgroundColor;
  Color get surface => _scheme.surface;
  Color get surfaceContainer => _scheme.surfaceContainer;
  Color get card => MyColors.cardColor;
  Color get grey => MyColors.greyColor;

  Color get textPrimary => _scheme.onSurface;
  Color get textSecondary => _scheme.onSurface.withValues(alpha: 0.7);
  Color get textTertiary => _scheme.onSurface.withValues(alpha: 0.5);

  Color get border => _scheme.outline;
  Color get cardBorder => primary.withValues(alpha: 0.15);
  Color get surfaceContainerHigh => _scheme.surfaceContainerHigh;
  Color get surfaceContainerLow => const Color(0xFF161F2B);
  Color get divider => Colors.white.withValues(alpha: 0.08);

  Color get success => MyColors.successColor;
  Color get error => MyColors.errorColor;
  Color get warning => MyColors.warningColor;
  Color get info => const Color(0xFF0288D1);

  Color get shimmerBase => const Color(0xFF1E293B);
  Color get shimmerHighlight => const Color(0xFF334155);

  LinearGradient get primaryGradient => LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  LinearGradient get cardGradient => LinearGradient(
    colors: [surface, surfaceContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// Standardized typography presets across the application.
class AppTypography {
  final BuildContext _context;
  const AppTypography(this._context);

  TextTheme get _textTheme => Theme.of(_context).textTheme;

  TextStyle get h1 =>
      _textTheme.headlineLarge ??
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get h2 =>
      _textTheme.headlineMedium ??
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get h3 =>
      _textTheme.headlineSmall ??
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle get titleLarge =>
      _textTheme.titleLarge ??
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get titleMedium =>
      _textTheme.titleMedium ??
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle get titleSmall =>
      _textTheme.titleSmall ??
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  TextStyle get body => _textTheme.bodyMedium ?? const TextStyle(fontSize: 14);
  TextStyle get bodyLarge =>
      _textTheme.bodyLarge ?? const TextStyle(fontSize: 16);
  TextStyle get bodySmall =>
      _textTheme.bodySmall ?? const TextStyle(fontSize: 12);
  TextStyle get labelLarge =>
      _textTheme.labelLarge ??
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle get labelMedium =>
      _textTheme.labelMedium ??
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle get labelSmall =>
      _textTheme.labelSmall ??
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
  TextStyle get caption =>
      _textTheme.bodySmall ?? const TextStyle(fontSize: 11);
}

/// Standardized radius tokens across the application.
class AppRadius {
  const AppRadius();

  Radius get xs => Radius.circular(4.r);
  Radius get sm => Radius.circular(8.r);
  Radius get md => Radius.circular(12.r);
  Radius get lg => Radius.circular(16.r);
  Radius get xl => Radius.circular(24.r);
  Radius get full => Radius.circular(999.r);

  BorderRadius get xsBorder => BorderRadius.circular(4.r);
  BorderRadius get smBorder => BorderRadius.circular(8.r);
  BorderRadius get mdBorder => BorderRadius.circular(12.r);
  BorderRadius get lgBorder => BorderRadius.circular(16.r);
  BorderRadius get xlBorder => BorderRadius.circular(24.r);
  BorderRadius get fullBorder => BorderRadius.circular(999.r);
}

/// Standardized animation durations across the application.
class AppDurations {
  const AppDurations();

  Duration get fast => const Duration(milliseconds: 150);
  Duration get normal => const Duration(milliseconds: 300);
  Duration get slow => const Duration(milliseconds: 500);
}

/// Standardized spacing tokens using flutter_screenutil.
class AppSpacing {
  const AppSpacing();

  double get xs => 4.w;
  double get sm => 8.w;
  double get md => 16.w;
  double get lg => 24.w;
  double get xl => 32.w;
}

/// Standardized sizing tokens using flutter_screenutil.
class AppSizes {
  const AppSizes();

  double get buttonHeight => 48.h;
  double get inputHeight => 48.h;
  double get minTouchTarget => 48.w;
  double get cardPadding => 16.r;
}

/// Extension on [BuildContext] providing clean access to design system tokens and localization.
extension AppContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColors get colors => AppColors(this);
  AppTypography get typography => AppTypography(this);
  AppRadius get radius => const AppRadius();
  AppDurations get durations => const AppDurations();
  AppSpacing get spacing => const AppSpacing();
  AppSizes get sizes => const AppSizes();
  AppLocalizations? get l10n => AppLocalizations.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;
}
