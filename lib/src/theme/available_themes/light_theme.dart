import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../base_theme.dart';

class LightTheme implements BaseTheme {
  @override
  ThemeData get theme => ThemeData(
        primarySwatch: const MaterialColor(4280361249, {
          50: Color(0xfff2f2f2),
          100: Color(0xffe6e6e6),
          200: Color(0xffcccccc),
          300: Color(0xffb3b3b3),
          400: Color(0xff999999),
          500: Color(0xff808080),
          600: Color(0xff666666),
          700: Color(0xff4d4d4d),
          800: Color(0xff333333),
          900: Color(0xff191919)
        }),
        fontFamily: GoogleFonts.openSans().fontFamily,
        brightness: Brightness.light,
        primaryColor: BaseTheme.primaryColor,
        primaryColorDark: BaseTheme.lightThemeDarkColor,
        primaryColorLight: BaseTheme.lightThemeLightColor,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.black,
        dialogBackgroundColor: Colors.white,
        cardColor: Colors.white,
        canvasColor: BaseTheme.lightThemeBoxColor,
        selectedRowColor: Colors.white,
        unselectedWidgetColor: Colors.white,
        dividerColor: BaseTheme.primaryColor,
        highlightColor: const Color(0xffefefef),
        splashColor: const Color(0x40cccccc),
        disabledColor: const Color(0x4dffffff),
        toggleableActiveColor: BaseTheme.primaryColor,
        secondaryHeaderColor: const Color(0xff616161),
        indicatorColor: const Color(0xff06D9E4),
        hintColor: const Color(0x80ffffff),
        errorColor: BaseTheme.redColor,
        appBarTheme: AppBarTheme(
            backgroundColor: BaseTheme.primaryColor,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: BaseTheme.defaultFontFamily,
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                height: 1.5)),
        textTheme: TextTheme(
          caption: TextStyle(
            color: BaseTheme.lightThemeTextColor,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            fontFamily: BaseTheme.defaultFontFamily,
          ),
          headline1: TextStyle(
            color: BaseTheme.lightThemeTextColor,
            fontSize: 24,
            fontFamily: BaseTheme.defaultFontFamily,
            fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
            color: BaseTheme.lightThemeTextColor,
            fontSize: 18,
            fontFamily: BaseTheme.defaultFontFamily,
            fontWeight: FontWeight.w600,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: BaseTheme.defaultFontFamily,
            fontWeight: FontWeight.w600,
          ),
          subtitle1: TextStyle(
            color: BaseTheme.lightThemeTextColor,
            fontSize: 16,
            fontFamily: BaseTheme.defaultFontFamily,
          ),
          subtitle2: TextStyle(
            color: BaseTheme.lightThemeTextLightColor,
            fontSize: 14,
            fontFamily: BaseTheme.defaultFontFamily,
          ),
          bodyText1: const TextStyle(
            color: BaseTheme.lightThemeTextLightColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
              color: BaseTheme.lightThemeTextColor,
              fontSize: 10,
              fontFamily: BaseTheme.defaultFontFamily),
          button: TextStyle(
              color: BaseTheme.lightThemeTextColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: BaseTheme.defaultFontFamily),
          overline: TextStyle(
              color: BaseTheme.primaryColor,
              fontSize: 14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              fontFamily: BaseTheme.defaultFontFamily),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: BaseTheme.lightThemeTextLightColor,
            fontFamily: BaseTheme.defaultFontFamily,
            fontSize: 14,
          ),
          helperStyle: TextStyle(
            color: BaseTheme.lightThemeTextLightColor,
            fontFamily: BaseTheme.defaultFontFamily,
            fontSize: 14,
          ),
          hintStyle: TextStyle(
            color: BaseTheme.lightThemeTextLightColor,
            fontFamily: BaseTheme.defaultFontFamily,
            fontSize: 14,
          ),
          errorStyle: TextStyle(
            color: BaseTheme.redColor,
            fontFamily: BaseTheme.defaultFontFamily,
            fontSize: 14,
          ),
          errorMaxLines: null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: false,
          fillColor: Colors.white,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: BaseTheme.redColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xffE5E5E5),
              color: BaseTheme.lightThemeTextColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE5E5E5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE5E5E5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE5E5E5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE5E5E5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        iconTheme: const IconThemeData(
          color: BaseTheme.lightThemeIconColor,
          size: 24.0,
        ),
        primaryIconTheme: const IconThemeData(
          color: BaseTheme.lightThemeIconColor,
          size: 24.0,
        ),
      );
}
