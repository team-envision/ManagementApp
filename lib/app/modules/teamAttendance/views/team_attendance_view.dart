import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../controllers/team_attendance_controller.dart';

class TeamAttendanceView extends GetView<TeamAttendanceController> {
  const TeamAttendanceView({super.key});

//MY TEAM PAGE PE ICON PE CLICK KARNE SE IT WILL USE THE SAME PAGE BUT DIFFERENT LOGIC JISME ORGANISERS PE CLICK KARNE PE SIRF ORGANISER KA AAYEGA
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(5),
            child: Image.asset(KImages.backIcon),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Get.theme.darkBlue,
        title: Text(Text_string.myTeamButton, style: Get.theme.kTitleTextStyle),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Get.theme.darkBlue,
                  Get.theme.darkTeal,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 1.0])),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: SizedBox(
                  height: screenHeight * 0.05,
                  width: screenWidth,
                  child: TextField(
                    style: Get.theme.kSearchTextFieldStyle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      prefixIcon:
                          Icon(KIcons.search, color: Get.theme.deepBlack),
                      hintText: Text_string.searchHint,
                      hintStyle: Get.theme.kSearchHintTextStyle,
                      filled: true,
                      fillColor: Get.theme.fadedWhite,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Get.theme.fadedWhite),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.all(8.0),
                          collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text(Text_string.nameDisplay,
                              style: Get.theme.kSubTitleTextStyle),
                          backgroundColor: Get.theme.deepBlack,
                          collapsedBackgroundColor: Get.theme.deepBlack,
                          leading: CircleAvatar(
                            backgroundColor: Get.theme.fadedWhite,
                          ),
                          children: [
                            ListTile(
                                title: Text(Text_string.idNoTile,
                                    style: Get.theme.kBodyTextStyle)),
                            ListTile(
                                title: Text(Text_string.domainTile,
                                    style: Get.theme.kBodyTextStyle)),
                            ListTile(
                                title: Text(Text_string.totalMeetsConductedTile,
                                    style: Get.theme.kBodyTextStyle)),
                            ListTile(
                                title: Text(Text_string.noOfMeetsConductedTile,
                                    style: Get.theme.kBodyTextStyle)),
                            ListTile(
                                title: Text(Text_string.noOfAbsencesTile,
                                    style: Get.theme.kBodyTextStyle)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
