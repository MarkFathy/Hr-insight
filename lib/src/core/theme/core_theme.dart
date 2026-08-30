import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/consts.dart';

const fontFamily = 'Cairo';
const secondaryColor = Color.fromARGB(255, 30, 63, 107);

/// اللون الرئيسي: أصفر زاهي ومميز للمظاهر الداكنة
const primaryColor = Color(0xFFFFC107); // Vibrant Yellow

const bg = Color.fromARGB(255, 20, 28, 37);

final themeData = ThemeData(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: bg,

  // ========== Dialog & Sheet Themes ==========
  dialogTheme: DialogThemeData(
    backgroundColor: MyColors.greyColor,
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
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: MyColors.greyColor,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  ),

  // ========== Input Fields Theme ==========
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.white70, fontFamily: fontFamily),
    labelStyle: const TextStyle(color: Colors.white, fontFamily: fontFamily),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: primaryColor, width: 2),
    ),
  ),

  // ========== AppBar ==========
  appBarTheme: const AppBarTheme(
    backgroundColor: secondaryColor,
    iconTheme: IconThemeData(color: primaryColor),
    titleTextStyle: TextStyle(
      color: primaryColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    ),
  ),

  primaryColor: primaryColor,
  fontFamily: fontFamily,

  // ========== Text Selection & Context Menu ==========
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionColor: primaryColor.withValues(alpha: 0.35),
    selectionHandleColor: primaryColor,
  ),

  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xFF1E293B),
    textStyle: const TextStyle(color: Colors.white, fontFamily: fontFamily),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),

  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(
    secondary: secondaryColor,
    brightness: Brightness.dark,
    surface: const Color(0xFF1E293B), // أزرق كربوني فخم (Slate 800) مريح للعين وقوائم الـ ContextMenu
    surfaceContainer: const Color(0xFF1E293B),
    surfaceContainerHigh: const Color(0xFF334155), // Slate 700
    onSurface: Colors.white, // لون النصوص على الـ Surface والقوائم (أبيض)
    onSurfaceVariant: Colors.white,
    onSecondary: Colors.white,
    onPrimary: Colors.black,
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
