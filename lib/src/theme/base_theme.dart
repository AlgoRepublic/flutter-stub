import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseTheme {
  static const Color primaryColor = Color(0xff1CDBA1);
  static const Color redColor = Colors.red;

  static const Color lightThemeDarkColor = Color(0xff0e182d);
  static const Color lightThemeLightColor = Color(0xffC4C4C4);

  static const Color lightThemeTextColor = Colors.black;
  static const Color lightThemeTextLightColor = Color(0xff8a8a8a);

  static const Color lightThemeIconColor = Color(0xff8a8a8a);
  static const Color lightThemeBoxColor = Color(0xfff5f5f5);

  static String? defaultFontFamily = GoogleFonts.inter().fontFamily;

  ThemeData get theme;
}
