import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The App Theme
class AppTheme {
  /// Light ThemeData
  static ThemeData light() {
    final textTheme = _getTextTheme(brightness: Brightness.light);

    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
          textTheme: _getAppBarTextTheme(brightness: Brightness.light)),
      textButtonTheme: _getTextButtonTheme(),
    );
  }

  /// Dark ThemeData
  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      textButtonTheme: _getTextButtonTheme(),
    );
  }

  static const _primaryColor = Colors.teal;
  static const _accentColor = Colors.white;

  static TextTheme _getAppBarTextTheme({@required Brightness brightness}) {
    final themeData = ThemeData(
        brightness: brightness,
        textTheme: TextTheme(
            headline2:
                GoogleFonts.ptSansCaption(fontSize: 20, color: Colors.white)));

    return GoogleFonts.ptSansCaptionTextTheme(themeData.textTheme);
  }

  static TextTheme _getTextTheme({@required Brightness brightness}) {
    final themeData = ThemeData(
        brightness: brightness,
        textTheme: TextTheme(
          bodyText1:
              GoogleFonts.ptSansCaption(fontSize: 15, color: Colors.black54),
          bodyText2:
              GoogleFonts.ptSansCaption(fontSize: 10, color: Colors.black26),
        ));

    return GoogleFonts.ptSansCaptionTextTheme(themeData.textTheme);
  }

  static TextButtonThemeData _getTextButtonTheme() {
    return TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(_primaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.roboto()
                .copyWith(color: Colors.white, fontSize: 20))));
  }
}
