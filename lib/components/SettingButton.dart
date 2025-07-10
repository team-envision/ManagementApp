import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

class Settingbutton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const Settingbutton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        backgroundColor: Get.theme.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Get.theme.pureBlack,
            width: 1.0
          )
        ),
      ),

      onPressed: onPressed,
      child: Text(
       title,
       style: Get.theme.kSubTitleTextStyle,
      ),

    );
  }
}
