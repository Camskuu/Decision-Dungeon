import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkPanel = Color(0xFF1E1E1E);
  static const Color gold = Color(0xFFFFC107);
  static const Color red = Color(0xFFB71C1C);
  static const Color green = Color(0xFF2E7D32);
  static const Color textLight = Color(0xFFF5F5F5);

  static const Color lightBackground = Color(0xFFF2E4C4);
  static const Color lightPanel = Color(0xFFE6D6B5);
  static const Color lightText = Color(0xFF2C1D0E);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: gold,
      secondary: red,
      surface: darkPanel,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: gold,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Jacquard12',
        fontSize: 42,
        color: gold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Kings',
        fontSize: 28,
        color: textLight,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 20,
        color: textLight,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 17,
        color: textLight,
        height: 1.35,
      ),
      labelLarge: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 18,
        color: textLight,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7A4E00),
      secondary: Color(0xFF9C2F2F),
      surface: lightPanel,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3A2412),
      foregroundColor: Color(0xFFFFD54F),
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Jacquard12',
        fontSize: 42,
        color: Color(0xFF7A4E00),
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Kings',
        fontSize: 28,
        color: lightText,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 20,
        color: lightText,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 17,
        color: lightText,
        height: 1.35,
      ),
      labelLarge: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 18,
        color: lightText,
      ),
    ),
  );
}