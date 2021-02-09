import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanshop/styles/colors.dart';

abstract class TextStyles {
  static TextStyle get title {
    return GoogleFonts.ptSansCaption(
        textStyle: TextStyle(color: AppColors.darkblue, fontSize: 40.0));
  }

  static TextStyle get xlarge {
    return GoogleFonts.ptSansCaption(
        textStyle: TextStyle(color: AppColors.textColor, fontSize: 50.0));
  }

  static TextStyle get large {
    return GoogleFonts.ptSansCaption(
        textStyle: TextStyle(color: AppColors.textColor, fontSize: 40.0));
  }
}
