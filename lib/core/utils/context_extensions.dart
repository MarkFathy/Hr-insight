import 'package:flutter/material.dart';
import 'package:hr_app/core/constants/app_constants.dart';
import 'package:hr_app/core/utils/responsive.dart';
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
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  TextStyle get h2 =>
      _textTheme.headlineMedium ??
      const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle get h3 =>
      _textTheme.headlineSmall ??
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get titleLarge =>
      _textTheme.titleLarge ??
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle get titleMedium =>
      _textTheme.titleMedium ??
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get titleSmall =>
      _textTheme.titleSmall ??
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle get body => _textTheme.bodyMedium ?? const TextStyle(fontSize: 15);
  TextStyle get bodyLarge =>
      _textTheme.bodyLarge ?? const TextStyle(fontSize: 17);
  TextStyle get bodySmall =>
      _textTheme.bodySmall ?? const TextStyle(fontSize: 13);
  TextStyle get labelLarge =>
      _textTheme.labelLarge ??
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  TextStyle get labelMedium =>
      _textTheme.labelMedium ??
      const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500);
  TextStyle get labelSmall =>
      _textTheme.labelSmall ??
      const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w500);
  TextStyle get caption =>
      _textTheme.bodySmall ?? const TextStyle(fontSize: 12.5);
}

/// Standardized radius tokens across the application.
class AppRadius {
  const AppRadius();

  Radius get xs => const Radius.circular(4);
  Radius get sm => const Radius.circular(8);
  Radius get md => const Radius.circular(12);
  Radius get lg => const Radius.circular(16);
  Radius get xl => const Radius.circular(24);
  Radius get full => const Radius.circular(999);

  BorderRadius get xsBorder => BorderRadius.circular(4);
  BorderRadius get smBorder => BorderRadius.circular(8);
  BorderRadius get mdBorder => BorderRadius.circular(12);
  BorderRadius get lgBorder => BorderRadius.circular(16);
  BorderRadius get xlBorder => BorderRadius.circular(24);
  BorderRadius get fullBorder => BorderRadius.circular(999);
}

/// Standardized animation durations across the application.
class AppDurations {
  const AppDurations();

  Duration get fast => const Duration(milliseconds: 150);
  Duration get normal => const Duration(milliseconds: 300);
  Duration get slow => const Duration(milliseconds: 500);
}

/// Standardized spacing tokens using native logical pixels.
class AppSpacing {
  const AppSpacing();

  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
}

/// Standardized sizing tokens using native logical pixels.
class AppSizes {
  const AppSizes();

  double get buttonHeight => 48.0;
  double get inputHeight => 48.0;
  double get minTouchTarget => 48.0;
  double get cardPadding => 16.0;
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

  bool get isCompact => AppBreakpoints.isCompact(this);
  bool get isStandardPhone => AppBreakpoints.isStandardPhone(this);
  bool get isTablet => AppBreakpoints.isTablet(this);
  bool get isExpanded => AppBreakpoints.isExpanded(this);
}
