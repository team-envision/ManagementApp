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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorLevel1, theme.colorLevel2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: theme.colorLevel2,
                      ),
                    ),
                    Positioned(
                      top: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 60),
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
                            fontSize: 22
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Settingbutton(title: 'MY PROFILE', onPressed: () {}),
                      const SizedBox(height: 30),
                      Settingbutton(title: 'REGISTRATION', onPressed: () {}),
                      const SizedBox(height: 30),
                      Settingbutton(title: 'MY TEAM', onPressed: () {}),
                      const SizedBox(height: 250),
                      Logoutbutton(onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
