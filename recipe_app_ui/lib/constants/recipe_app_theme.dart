import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeAppTheme {
  // 1 LightMode TextTheme
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )
  );

  // Icon Theme
  static IconThemeData lightIconTheme = const IconThemeData(
    color: Colors.black,
  );

  // LightMode Theme data
  static ThemeData light() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      primaryColor: Colors.teal.shade100,
      primaryColorDark: Colors.teal.shade400,
      textTheme: lightTextTheme,
      iconTheme: lightIconTheme,
    );
  }
}