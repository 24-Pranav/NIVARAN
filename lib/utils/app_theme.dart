
import 'package:flutter/material.dart';

class AppTheme {
  // Define the color palette
  static const Color primaryRed = Color(0xFFD32F2F);
  static const Color primaryOrange = Color(0xFFF57C00);
  static const Color accentColor = Color(0xFFFFAB40);
  static const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF212121);
  static const Color cardColor = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryOrange,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryOrange,
        secondary: accentColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryOrange,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      iconTheme: const IconThemeData(
        color: primaryOrange,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: textColor),
        bodyText1: TextStyle(fontSize: 16.0, color: textColor),
        bodyText2: TextStyle(fontSize: 14.0, color: textColor),
        button: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
      ),
    );
  }
}
