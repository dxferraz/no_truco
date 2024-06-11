import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFFD700);
const Color onPrimary = Color.fromRGBO(0, 0, 0, 0.2);
const Color secondary = Color(0xFF990000);
const Color background = Color(0xFFFFFFFF);
const Color onBackground = Color(0xFF202020);
const Color error = Color.fromARGB(255, 255, 85, 85);
const Color surface = Color.fromRGBO(255, 231, 95, 1);

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onPrimary,
    error: error,
    onError: onPrimary,
    surface: surface,
    onSurface: onPrimary,
  ),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: onBackground,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: onBackground,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: onBackground,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: onBackground,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: onBackground,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: onBackground,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: onBackground,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: onBackground,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: onBackground,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: onBackground,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: onBackground,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: onBackground,
    ),
  ),
);
