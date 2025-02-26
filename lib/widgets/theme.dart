import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData tema1() {
  return ThemeData(
    
    // color base
    scaffoldBackgroundColor: Color.fromARGB(255, 157, 157, 157), // Dark grey background
    primaryColor: Color.fromARGB(255, 50, 92, 139), // Deep Purple

    // el appbar
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 50, 92, 139),
      titleTextStyle: GoogleFonts.roboto(
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

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
    ),

  );
}
