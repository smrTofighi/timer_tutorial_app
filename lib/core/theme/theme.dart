import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            Colors.greenAccent,
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            Colors.greenAccent,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.greenAccent),
      cardColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
        ),
      ),
      scaffoldBackgroundColor: Colors.black26,
    );
  }
}
