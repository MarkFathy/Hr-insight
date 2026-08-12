import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/consts.dart';

const fontFamily = 'Cairo';
const secondaryColor = Color.fromARGB(255, 30, 63, 107);

/// اللون الرئيسي: amber/gold غامق يظهر بوضوح على الخلفيات الداكنة
const primaryColor = Color(0xFFC8920A); // deep amber - high contrast on dark surfaces

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

  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(
    secondary: secondaryColor,
    brightness: Brightness.dark,
    surface: MyColors.greyColor,
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
