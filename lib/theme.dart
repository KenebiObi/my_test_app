import 'package:flutter/material.dart';

final ThemeData lighTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: const Color.fromRGBO(7, 106, 154, 1.000),
    secondary: Colors.blue[100]!,
    tertiary: Colors.grey[700],
    background: Colors.white,
  ),
  fontFamily: "Karla",
  useMaterial3: true,
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: const Color.fromRGBO(7, 106, 154, 1.000),
    secondary: const Color.fromRGBO(192, 230, 255, 1),
    tertiary: Colors.grey[700],
    background: Colors.grey[900]!,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.grey[600],
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      foregroundColor: Colors.blue[100],
    ),
  ),
  fontFamily: "Karla",
  useMaterial3: true,
);
