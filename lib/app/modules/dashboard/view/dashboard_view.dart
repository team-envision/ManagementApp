import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:managment_app/app/modules/meetings/components/MeetsConductedTile.dart';
import 'package:managment_app/app/modules/meetings/components/UpcomingMeetTile.dart';
import '../../meetings/components/AnnouncementBox.dart';
import '../controller/dasboard_controller.dart';
import 'package:managment_app/Themes/themes.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Scaffold(
        backgroundColor: theme.colorLevel1,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.colorLevel1, theme.colorLevel0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/Ellipse 53.svg',
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/Ellipse 54.svg',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                top: 300,
                left: 0,
                child: SvgPicture.asset(
                  'assets/images/Ellipse 50.svg',
                  width: 300,
                  height: 300,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/Ellipse 48.svg',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'TEAM ENVISION',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Hi, KARTIK JHANWAR",
                      style: theme.kTitleTextStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 40),
                    Text(
                      "ANNOUNCEMENT",
                      style: theme.kTitleTextStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    AnnouncementBox(announcement: 'Nil'),
                    SizedBox(height: 40),
                    Text(
                      "Upcoming Meets",
                      style: theme.kTitleTextStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    UpcomingMeetTile(
                      title: 'Design - 4/06/24',
                      details: 'Time : 10:45 pm\nVenue : CRC 501',
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Meets Conducted",
                      style: theme.kTitleTextStyle,
                    ),
                    SizedBox(height: 8),
                    MeetsConductedTile(title: 'Design - 4/06/24', OnUpdateAttendance: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
