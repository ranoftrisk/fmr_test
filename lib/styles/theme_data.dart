import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
        fontSize: 20,
      ),
      bodySmall: TextStyle(fontSize: 16),
    ),
    useMaterial3: true,
  );
}
