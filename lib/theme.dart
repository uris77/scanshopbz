import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final textTheme = _getTextTheme(brightness: Brightness.light);

    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
          textTheme: _getAppBarTextTheme(brightness: Brightness.light)),
    );
  }

  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        textTheme: textTheme,
        primaryTextTheme: textTheme);
  }

  static const _primaryColor = Colors.teal;
  static const _accentColor = Colors.white;

  static _getAppBarTextTheme({@required Brightness brightness}) {
    final themeData = ThemeData(
        brightness: brightness,
        textTheme: TextTheme(
            headline2:
                GoogleFonts.ptSansCaption(fontSize: 20, color: Colors.white)));

    return GoogleFonts.ptSansCaptionTextTheme(themeData.textTheme);
  }

  static _getTextTheme({@required Brightness brightness}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.ptSansCaptionTextTheme(themeData.textTheme);
  }
}
