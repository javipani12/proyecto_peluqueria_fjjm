import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppThemes {
  static const Color primary = Colors.blueGrey;


  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    // Botones de inicio de sesión, registro, reestablecer contraseña, continuar y llamar
    // Por el momento
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
        elevation: 2,
        alignment: Alignment.center,
        minimumSize: const Size(300, 40),
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),

    // Colores de los iconos de la listas
    listTileTheme: const ListTileThemeData(
      iconColor: primary,
    ),

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: primary,
      side: BorderSide(color: Colors.blue, width: 2),
    )),

    // Botón volver hacia atrás
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
    ),

    // Formulario de registro y de login
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
    ),

    // Card
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),

    // ProgressIndicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primary,
      circularTrackColor: primary,
    ),
  );
}
