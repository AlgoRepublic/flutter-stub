import 'package:flutter/material.dart';

import 'available_themes/light_theme.dart';

enum AllThemes { light, dark }



class AppTheme {


  static ThemeData getTheme({AllThemes theme = AllThemes.light}) {
    switch (theme) {
      case AllThemes.light:
        return LightTheme().theme;
      default:
        return LightTheme().theme;
    }
  }
}
