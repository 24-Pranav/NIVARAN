
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.orange,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.orange,
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
          .copyWith(secondary: Colors.orangeAccent),
    );
  }
}
