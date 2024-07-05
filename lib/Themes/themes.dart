

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeExtension on ThemeData {


  Color get dayNight => brightness == Brightness.dark
      ? const Color(0xffffffff)
      : const Color(0xff000000);

  Color get colorPrimary => const Color(0xFF3EC9CF); // cyan
  Color get colorLevel0 => const Color(0xFF010206); // black
  Color get colorLevel1 => const Color(0xFF002431); // darkBlue
  Color get colorLevel2 => const Color(0xFF094454); // deepBlue
  Color get colorLevel3 => const Color(0xFFD9D9D9); // lightGrey
  Color get colorLevel4 => const Color.fromARGB(236, 255, 255, 255);

// DIMENSIONS:

  double get kCardBorderRadius => 10.0;
  double get kTextFieldBorderRadius => 8.0;
  double get kButtonBorderRadius => 8.0;

// FONTS AND TEXT STYLES:

  TextStyle get kTitleTextStyle => GoogleFonts.roboto(
      fontWeight: FontWeight.w600, color: colorLevel4, fontSize: 20, height: 1);

  TextStyle get kSubTitleTextStyle => GoogleFonts.roboto(
      fontWeight: FontWeight.w600, color: colorLevel4, fontSize: 16, height: 1);

  TextStyle get kBodyTextStyle => GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: colorLevel4, fontSize: 14, height: 1.5);

  TextStyle get kSmallTextStyle => GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: colorLevel4, fontSize: 12, height: 1.5);

  TextStyle get kVerySmallTextStyle => GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: colorLevel4, fontSize: 10, height: 1);
}

// THEMES

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xffffffff),
            statusBarIconBrightness: Brightness.dark)),
    scaffoldBackgroundColor: const Color(0xffffffff),
  );

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Get.theme.colorLevel0,
            statusBarIconBrightness: Brightness.light)),
    scaffoldBackgroundColor: Get.theme.colorLevel0,
  );


}
