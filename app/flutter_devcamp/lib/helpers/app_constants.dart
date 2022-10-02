import 'package:flutter/material.dart';

class AppConstants {
  static const String appPrimaryColor = "#009099";
  static const String appBackgroundColor = "#F6F8F9";
  static const String appBackgroundColorWhite = "#FFFFFF";
  static const String appPrimaryColorLight = "#9f9f9f";

  static const String appPrimaryColorBlack = "#000000";
  static const String appPrimaryFontColorWhite = "#FFFFFF";
  static const String appPrimaryFontColorLight = "#9f9f9f";

  static const String appPrimaryColorAction = "#009079";
  static const String appPrimaryTileColor = "#009099";
  static const String appPrimaryColorGreen = "#009099";
  static const String appPrimaryColorGreenLight = "#d1fcff";

  static const String appBackgroundColorGray = "#D0D0D0";

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
