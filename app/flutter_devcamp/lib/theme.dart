// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_constants.dart';

var appTheme = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor:
          AppConstants.hexToColor(AppConstants.appPrimaryColorGreen)),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromARGB(221, 175, 175, 175),
  ),
  brightness: Brightness.light,
  primaryColor: AppConstants.hexToColor(AppConstants.appPrimaryColorGreen),
  backgroundColor: AppConstants.hexToColor(AppConstants.appBackgroundColor),
  primaryColorLight: AppConstants.hexToColor(AppConstants.appPrimaryColorLight),
  dividerColor: AppConstants.hexToColor(AppConstants.appBackgroundColorGray),
  textTheme: TextTheme(
    caption: TextStyle(
        color: AppConstants.hexToColor(AppConstants.appPrimaryFontColorWhite)),
    bodyText1: TextStyle(fontSize: 18),
    bodyText2: TextStyle(fontSize: 16),
    button: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  fontFamily: GoogleFonts.nunito().fontFamily,
);

class ThemeTextStyle {
  static TextStyle loginTextFieldStyle = GoogleFonts.lato(
      textStyle: TextStyle(
    color: Colors.blueGrey,
  ));
}
