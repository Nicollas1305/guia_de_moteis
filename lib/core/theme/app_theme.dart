import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: false,
      primaryColor: const Color(0xFFD01721),
      secondaryHeaderColor: const Color(0xFFF8F8FA),
      disabledColor: const Color(0xFFB9000D),
      scaffoldBackgroundColor: const Color(0xFFF9F9FA),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFD01721),
      ),
    );
  }
}
