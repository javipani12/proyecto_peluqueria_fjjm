import 'package:flutter/material.dart';

class AppThemes {
  static const Color primary = Colors.red;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: primary, shape: const StadiumBorder(), elevation: 4),
    ),
  );
}
