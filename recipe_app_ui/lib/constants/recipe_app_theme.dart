import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_ui/constants/constants.dart';

class RecipeAppTheme {
  // 1 LightMode TextTheme
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xfff2e2e0),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    )
  );

  // Icon Themes
  static IconThemeData homePageIconTheme = const IconThemeData(
    color: Colors.white,
  );

  static IconThemeData recipePageIconTheme = const IconThemeData(
    color: Colors.blueGrey,
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      primaryColor: homePageBackgroundColor,
      primaryColorDark: homePageFilterListColor,
      textTheme: lightTextTheme,
      iconTheme: homePageIconTheme,
      primaryIconTheme: recipePageIconTheme,
    );
  }
}