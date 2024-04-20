import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryLight = Color(0xFFFFA500);
  static const Color secondaryLight = Color(0xFF005959);

  static ThemeData lightMode = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      centerTitle: true,
      foregroundColor: Color(0xFF000000),
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 32,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLight,
      primary: primaryLight,
      secondary: secondaryLight,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      space: 10,
      thickness: 1,
    ),
  );
}
