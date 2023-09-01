import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Conthrax',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFD700),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF990000),
    onSecondary: Color(0xFFFFFFFF),
    error: Color.fromARGB(255, 255, 118, 118),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFF202020),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFFFD700),
    onSurface: Color(0xFFFFFFFF),
  ),
);
