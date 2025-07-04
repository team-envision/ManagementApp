import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

class MeetsConductedTile extends StatelessWidget {
  final String title;
  final VoidCallback OnUpdateAttendance;


  const MeetsConductedTile({
    Key?key,
    required this.title,
    required this.OnUpdateAttendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Get.theme.lightBlue,
        borderRadius:  BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Get.theme.kAnnouncementTextStyle,
          ),
          ConstrainedBox(constraints: BoxConstraints.tightFor(
           width: 101,
            height: 40,
          ),
          child : ElevatedButton(onPressed: OnUpdateAttendance,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                side: BorderSide(width: 1, color: Get.theme.pureBlack),
                backgroundColor: Get.theme.lightBlue,
              ),
              child: Center(
              child: Text(Text_string.updateAttendanceButton, textAlign: TextAlign.center, style: Get.theme.kButtonTextStyle3)),))
        ],
      )

    );
  }



}