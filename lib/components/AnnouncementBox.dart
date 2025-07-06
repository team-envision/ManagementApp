import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

class AnnouncementBox extends StatelessWidget {
  final String announcement;

  const AnnouncementBox({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: Get.theme.lightBlue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        announcement,
        style: Get.theme.kAnnouncementTextStyle,
      ),
    );
  }
}
