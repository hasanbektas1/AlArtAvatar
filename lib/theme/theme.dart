import 'package:flutter/material.dart';
import 'package:alartavatar/theme/theme_color.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ThemeColor.themeColor,
        scaffoldBackgroundColor: ThemeColor.themeColor.background,
        appBarTheme: const AppBarTheme(color: Colors.black),
        //-----------------------Text Control-------------------
        textTheme: TextTheme(
            // size = 24
            bodyLarge: const TextStyle(
              color: ThemeColor.mainTitle,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            // default text theme size = 14
            bodyMedium: const TextStyle(
              fontSize: 16,
              color: ThemeColor.mainTitle,
            ),
            // size=12
            bodySmall: const TextStyle(
              fontSize: 12,
              color: ThemeColor.secondaryTitle,
            ),
            titleLarge: TextStyle(
              color: ThemeColor.themeColor.onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(color: ThemeColor.themeColor.secondary),
            titleSmall: TextStyle(
                color: ThemeColor.themeColor.secondary, fontSize: 14)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColor.themeColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32), // Kenar yarıçapı
            ),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
                iconSize: 32, foregroundColor: Colors.white)));
  }
}
