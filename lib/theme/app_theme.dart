import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF1A1A1A);
  static const Color panel = Color(0xFF262626);
  static const Color gold = Color(0xFFFFC107);
  static const Color red = Color(0xFFB71C1C);
  static const Color green = Color(0xFF2E7D32);
  static const Color textLight = Color(0xFFF5F5F5);
  static const Color textMuted = Color(0xFFD6D6D6);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(
      primary: gold,
      secondary: red,
      surface: panel,
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
        color: textMuted,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 18,
        color: textLight,
      ),
      labelLarge: TextStyle(
        fontFamily: 'MedievalSharp',
        fontSize: 18,
        color: textLight,
      ),
    ),
  );
}