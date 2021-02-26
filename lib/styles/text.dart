import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanshop/styles/colors.dart';

/// The Text styles
abstract class TextStyles {
  /// Title
  static TextStyle get title {
    return GoogleFonts.ptSansCaption(
        textStyle: TextStyle(color: AppColors.darkblue, fontSize: 40.0));
  }

  /// Xlarge
  static TextStyle get xlarge {
    return GoogleFonts.ptSansCaption(
        textStyle: const TextStyle(color: AppColors.textColor, fontSize: 50.0));
  }

  /// Large
  static TextStyle get large {
    return GoogleFonts.ptSansCaption(
        textStyle: const TextStyle(color: AppColors.textColor, fontSize: 40.0));
  }

  /// LargeButton
  static TextStyle get largeButton {
    return GoogleFonts.ptSansCaption(
        textStyle: TextStyle(color: AppColors.white, fontSize: 40.0));
  }

  /// Medium
  static TextStyle get medium {
    return GoogleFonts.ptSansCaption(
        textStyle: const TextStyle(color: AppColors.textColor, fontSize: 30.0));
  }
}
