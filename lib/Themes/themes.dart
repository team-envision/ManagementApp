

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


extension ThemeExtension on ThemeData {


  Color get dayNight =>
      brightness == Brightness.dark
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


}
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
