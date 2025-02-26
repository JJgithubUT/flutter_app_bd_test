import 'package:flutter/material.dart';

ThemeData tema1() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF1E1E1E), // Dark grey background
    primaryColor: Color.fromARGB(255, 50, 92, 139), // Deep Purple
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 50, 92, 139),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      // Titulos pequeños
      headlineSmall: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      // Texto informativo 1
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 141, 193, 188),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      )
    ),
  );
}
