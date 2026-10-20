import 'package:flutter/material.dart';
import 'package:hr_app/src/core/constants/app_constants.dart';

const fontFamily = 'Cairo';
const secondaryColor = Color.fromARGB(255, 30, 63, 107);

/// اللون الرئيسي: أصفر زاهي ومميز للمظاهر الداكنة
const primaryColor = Color(0xFFFFC107); // Vibrant Yellow

const bg = Color.fromARGB(255, 20, 28, 37);
final themeData = ThemeData(
  fontFamily: fontFamily,
  textTheme:
      const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        bodyMedium: TextStyle(color: Colors.white, fontFamily: fontFamily),
        bodySmall: TextStyle(color: Colors.white, fontFamily: fontFamily),
        titleLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        titleMedium: TextStyle(color: Colors.white, fontFamily: fontFamily),
        titleSmall: TextStyle(color: Colors.white, fontFamily: fontFamily),
        labelLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        labelMedium: TextStyle(color: Colors.white, fontFamily: fontFamily),
        labelSmall: TextStyle(color: Colors.white, fontFamily: fontFamily),
        headlineLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        headlineMedium: TextStyle(color: Colors.white, fontFamily: fontFamily),
        headlineSmall: TextStyle(color: Colors.white, fontFamily: fontFamily),
        displayLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        displayMedium: TextStyle(color: Colors.white, fontFamily: fontFamily),
        displaySmall: TextStyle(color: Colors.white, fontFamily: fontFamily),
      ).apply(
        fontFamily: fontFamily,
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: bg,

  // ========== Card Theme ==========
  cardTheme: CardThemeData(
    color: const Color(0xFF1E293B),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: Color(0x26FFC107), // 15% primary accent
      ),
    ),
    margin: EdgeInsets.zero,
  ),

  // ========== Dialog & Sheet Themes ==========
  dialogTheme: DialogThemeData(
    backgroundColor: const Color(0xFF1E293B),
    surfaceTintColor: Colors.transparent,
    titleTextStyle: const TextStyle(
      color: primaryColor,
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontFamily: fontFamily,
      fontSize: 14,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: primaryColor.withValues(alpha: 0.2),
      ),
    ),
  ),

  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: const Color(0xFF1E293B),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    showDragHandle: true,
    dragHandleColor: Colors.white.withValues(alpha: 0.3),
  ),

  // ========== Input Fields Theme ==========
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E293B),
    hintStyle: TextStyle(
      color: Colors.white.withValues(alpha: 0.45),
      fontFamily: fontFamily,
      fontSize: 13,
    ),
    labelStyle: TextStyle(
      color: Colors.white.withValues(alpha: 0.7),
      fontFamily: fontFamily,
      fontSize: 13,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF334155)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF334155)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: primaryColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: MyColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: MyColors.errorColor, width: 1.5),
    ),
  ),

  // ========== Button Themes ==========
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
      elevation: 0,
      textStyle: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor, width: 1.5),
      textStyle: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),

  // ========== AppBar ==========
  appBarTheme: const AppBarTheme(
    backgroundColor: bg,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: primaryColor),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),

  primaryColor: primaryColor,

  // ========== Divider ==========
  dividerTheme: DividerThemeData(
    color: Colors.white.withValues(alpha: 0.08),
    thickness: 1,
    space: 1,
  ),

  // ========== Floating Action Button ==========
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.black,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // ========== Text Selection & Context Menu ==========
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionColor: primaryColor.withValues(alpha: 0.35),
    selectionHandleColor: primaryColor,
  ),

  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xFF1E293B),
    textStyle: const TextStyle(color: Colors.white, fontFamily: fontFamily),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
    ),
  ),

  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(
    secondary: secondaryColor,
    brightness: Brightness.dark,
    surface: const Color(0xFF1E293B),
    surfaceContainer: const Color(0xFF253347),
    surfaceContainerHigh: const Color(0xFF334155),
    onSurface: Colors.white,
    onSurfaceVariant: const Color(0xFFCBD5E1),
    onSecondary: Colors.white,
    onPrimary: Colors.black,
    outline: const Color(0xFF334155),
  ),
);

// final themeDark = ThemeData(
//   brightness: Brightness.dark,
//   primaryColorDark: const Color(0xFFFFC107),
//   fontFamily: fontFamily,
//   appBarTheme: const AppBarTheme(
//       backgroundColor: Color(0xff2C4833),
//       titleTextStyle: TextStyle(color: Colors.white, fontFamily: fontFamily)),
//   primaryColor: const Color(0xff2C4833),
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
//     secondary: const Color(0xFFFFE7BA),
//     brightness: Brightness.dark,
//   ),
// );
