import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/login/views/login_view.dart';
import 'package:managment_app/app/modules/markAttendanceView/views/mark_attendance_view.dart';
import 'package:managment_app/app/modules/teamAttendance/views/team_attendance_view.dart';
import 'package:managment_app/app/routes/app_pages.dart';
import 'package:managment_app/components/SettingButton.dart';
import 'package:managment_app/utilities/constants/strings.dart';

import '../../../../components/Logoutbutton.dart';
import '../../login/controllers/login_controller.dart';
import '../../profileEdit/views/profile_edit_view.dart';
import '../../registration/views/registration_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorLevel1, theme.colorLevel2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      color: theme.colorLevel2,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                        horizontal: screenWidth * 0.2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorLevel1,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        KStrings.settingsTitle,
                        style: theme.kTitleTextStyle.copyWith(
                          letterSpacing: 5,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.05,
                    horizontal: screenWidth * 0.1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Settingbutton(
                          title: KStrings.myProfileButton,
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE_EDIT);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KStrings.registrationButton,
                          onPressed: () {
                            Get.toNamed(Routes.REGISTRATION);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KStrings.updateTeamButton, //only for heads org
                          onPressed: () {
                            Get.toNamed(Routes.MARKATTENDANCEVIEW);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KStrings.myTeamButton,
                          onPressed: () {
                            Get.toNamed(Routes.TEAM_ATTENDANCE);
                          },
                        ),
                      ),
                      //add a button for past meetings conducted
                      const Spacer(),
                      Logoutbutton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN_VIEW);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
