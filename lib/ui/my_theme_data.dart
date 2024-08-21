import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThemeData {
  static const Color primaryLight = Color(0xFFFFA500);
  static const Color secondaryLight = Color(0xFF005959);
  static const Color lightGrey = Color(0xFFE0E0E0);

  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      centerTitle: true,
      foregroundColor: Color(0xFF000000),
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 32.sp,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLight,
      primary: primaryLight,
      secondary: secondaryLight,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      space: 10.sp,
      thickness: 1.sp,
    ),
  );
}
