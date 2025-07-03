import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeExtension on ThemeData {
  // COLORS

  Color get dayNight => brightness == Brightness.dark
      ? const Color(0xffffffff)
      : const Color(0xff000000);

  Color get brightCyan => const Color(0xFF3EC9CF);

  Color get deepBlack => const Color(0xFF010206);

  Color get darkBlue => const Color(0xFF002431);

  Color get darkTeal => const Color(0xFF094454);

  Color get lightGrey => const Color(0xFFD9D9D9);

  Color get fadedWhite => const Color.fromARGB(236, 255, 255, 255);

  Color get pureWhite => Colors.white;

  Color get fadedGrey => Colors.grey.withOpacity(0.3);

  Color get mediumGrey => Colors.grey;

  Color get transparent => Colors.transparent;

  Color get lighterGrey => Colors.grey[300] ?? mediumGrey;

  Color get pureBlack => Colors.black;

  Color get primaryGreen => Colors.green;

  Color get blueGrey => const Color.fromRGBO(158, 161, 174, 1);

  Color get lightBlue => Colors.blue[100] ?? Colors.blue;

  Color get darkGrey => Colors.grey[700] ?? Colors.grey;

  Color get lightRed => Colors.red[300] ?? Colors.red;

  Color get transparentBlack => Colors.black.withOpacity(0.1);

  // DIMENSIONS:

  double get kCardBorderRadius => 10.0;

  double get kTextFieldBorderRadius => 8.0;

  double get kButtonBorderRadius => 8.0;

  // FONTS AND TEXT STYLES:

  TextStyle get kLargeHeaderTextStyle => GoogleFonts.raleway(
    color: fadedWhite,
    fontWeight: FontWeight.w600,
    fontSize: 26,
    letterSpacing: 2,
  );
  TextStyle get kHeaderTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w600, color: fadedWhite, fontSize: 24, height: 1);

  TextStyle get kTitleTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w600, color: fadedWhite, fontSize: 20, height: 1);

  TextStyle get kSubTitleTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w600, color: fadedWhite, fontSize: 16, height: 1);

  TextStyle get kBodyTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w500,
      color: fadedWhite,
      fontSize: 14,
      height: 1.5);

  TextStyle get kSmallTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w500,
      color: fadedWhite,
      fontSize: 12,
      height: 1.5);

  TextStyle get kVerySmallTextStyle => GoogleFonts.raleway(
      fontWeight: FontWeight.w500, color: fadedWhite, fontSize: 10, height: 1);

  TextStyle get kLargeHintTextStyle => TextStyle(
      fontWeight: FontWeight.w400, color: mediumGrey, fontSize: 19);

  TextStyle get kDropdownHintTextStyle => TextStyle(color: Get.theme.mediumGrey, fontSize: 14,);

  TextStyle get kButtonTextStyle => kTitleTextStyle.copyWith(
    color: Get.theme.brightCyan,
    fontSize: 40,
  );

  TextStyle get kButtonTextStyle2 => GoogleFonts.raleway(
    color: Get.theme.darkGrey,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  TextStyle get kInputFieldTextStyle => TextStyle(color: pureWhite);

  TextStyle get kLinkTextStyle => TextStyle(color: mediumGrey);

  TextStyle get kSearchTextFieldStyle => GoogleFonts.raleway(
      textStyle: TextStyle(color: Get.theme.deepBlack));

  TextStyle get kSearchHintTextStyle => GoogleFonts.raleway(
      textStyle: TextStyle(color: Get.theme.deepBlack));
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
            statusBarColor: Get.theme.deepBlack,
            statusBarIconBrightness: Brightness.light)),
    scaffoldBackgroundColor: Get.theme.deepBlack,
  );
}
