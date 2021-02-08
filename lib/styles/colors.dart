import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get darkgray => const Color(0xFF4e5b60);

  static Color get lightgray => const Color(0xFFc8d6ef);

  static Color get darkblue => const Color(0xFF263a44);

  static Color get lightblue => const Color(0xFF48a1af);

  static Color get straw => const Color(0xFFe2a84b);

  static Color get red => const Color(0xFFee5253);

  static Color get green => const Color(0xFF3b7d02);

  static Color get blue => Colors.blue;

  /// App Background
  /// Off white
  static const background = Color(0xFFF7F7F7);
  static const cardBackground = Colors.white;
  static const activeFillColor = Color(0xFFE0E0E0);

  /// Text Theme
  /// For cards, content, and canvas:
  static const textColor = Color.fromRGBO(35, 35, 50, .7);

  /// For 'Primary' theme
  /// For headings
  static const displayTextColor = Colors.black;

  /// for 'Accent' theme
  static const accentTextColor = Colors.white70;

  static const purple = Color(0xFFB59FB5);

  static MaterialColor primary = MaterialColor(0xFFC18083, _primarySwatch);
  static MaterialColor accent = MaterialColor(0xFFFEEAE6, _accentSwatch);
}

Map<int, Color> _primarySwatch = {
  50: Color(0xFFFFF0E9),
  100: Color(0xFFFFDBCF),
  200: Color(0xFFFCB8AB),
  300: Color(0xFFF2A9A5),
  400: Color(0xFFE29896),
  500: Color(0xFFC18083),
  600: Color(0xFFA36A72),
  700: Color(0xFF84565E),
  800: Color(0xFF664046),
  900: Color(0xFF442B2D),
};

Map<int, Color> _accentSwatch = {
  50: Color(0xFFFEEAE6),
  100: Color(0xFFFFCEB9),
  200: Color(0xFFFEAE8B),
  300: Color(0xFFFC8F5C),
  400: Color(0xFFFA7736),
  500: Color(0xFFF86203),
  600: Color(0xFFEE5C00),
  700: Color(0xFFE05400),
  800: Color(0xFFD24D00),
  900: Color(0xFFBA4000),
};
