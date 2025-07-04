import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/images_const.dart';

import '../../../../components/AnnouncementBox.dart';
import '../../../../components/MeetsConductedTile.dart';
import '../../../../components/UpcomingMeetTile.dart';
import '../../../../utilities/constants/text_strings.dart';
import '../../../routes/app_pages.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.darkBlue, theme.deepBlack],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              KImages.ellipse53,
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              KImages.ellipse54,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            child: SvgPicture.asset(
              KImages.ellipse50,
              width: 300,
              height: 300,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              KImages.ellipse48,
              width: 100,
              height: 100,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Text_string.teamEnvision,
                    style: theme.kBigTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    Text_string.sampleUser,
                    style: theme.kTitleTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 40),
                  Text(
                    Text_string.announcementTitle,
                    style: theme.kTitleTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  AnnouncementBox(announcement: Text_string.sampleAnnouncement),
                  SizedBox(height: 40),
                  Text(
                    Text_string.upcomingMeetsTitle,
                    style: theme.kTitleTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  UpcomingMeetTile(
                    title: Text_string.sampleMeetTitle,
                    details: Text_string.sampleMeetDetails,
                  ),
                  SizedBox(height: 40),
                  Text(
                    Text_string.meetsConductedTitle,
                    style: theme.kTitleTextStyle,
                  ),
                  SizedBox(height: 8),
                  MeetsConductedTile(
                    title: Text_string.sampleMeetTitle,
                    OnUpdateAttendance: () {
                      Get.toNamed(Routes.MARKATTENDANCEVIEW);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
