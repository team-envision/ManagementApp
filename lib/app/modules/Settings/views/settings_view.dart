import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/routes/app_pages.dart';
import 'package:managment_app/components/SettingButton.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../../../../components/Logoutbutton.dart';
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
                colors: [Get.theme.darkBlue, Get.theme.darkTeal],
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
                      color: Get.theme.darkTeal,
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
                        color: Get.theme.darkBlue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Get.theme.transparentBlack,
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        KText.settingsTitle,
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
                          title: KText.myProfileButton,
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE_EDIT);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KText.registrationButton,
                          onPressed: () {
                            Get.toNamed(Routes.REGISTRATION);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KText.updateTeamButton,
                          //only for heads org
                          onPressed: () {
                            Get.toNamed(Routes.MARKATTENDANCEVIEW);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: KText.myTeamButton,
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
