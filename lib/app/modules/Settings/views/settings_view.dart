import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/components/SettingButton.dart';
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
                    top: -10,
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
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        "Settings",
                        style: theme.kTitleTextStyle.copyWith(
                          letterSpacing: 5,
                          fontSize: screenWidth * 0.05,
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
                          title: 'MY PROFILE',
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: 'REGISTRATION',
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Flexible(
                        child: Settingbutton(
                          title: 'MY TEAM',
                          onPressed: () {},
                        ),
                      ),
                      Spacer(),
                      Logoutbutton(onPressed: () {}),
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
