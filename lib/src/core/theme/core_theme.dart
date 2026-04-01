import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/consts.dart';

const fontFamily = 'Cairo';
const secondaryColor = Color.fromARGB(255, 30, 63, 107);
const primaryColor = Color(0xFFf5d656);
const bg = Color.fromARGB(255, 20, 28, 37);
final themeData = ThemeData(

  dialogBackgroundColor: MyColors.greyColor,
  textTheme:const TextTheme(
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
  appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      iconTheme: IconThemeData(color: primaryColor),
      titleTextStyle: TextStyle(
        color: primaryColor,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
      )),
  primaryColor: primaryColor,
  fontFamily: fontFamily,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow).copyWith(
    secondary: secondaryColor,
    brightness: Brightness.dark,

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
