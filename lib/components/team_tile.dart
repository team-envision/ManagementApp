import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BoxShadow, BuildContext, Center, Clip, Column, Container, CrossAxisAlignment, EdgeInsets, FontWeight, Image, InkWell, MainAxisAlignment, Offset, Padding, Positioned, Stack, StatelessWidget, Text, VoidCallback, Widget;
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';


class TeamTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const TeamTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              color: Get.theme.colorLevel2,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Get.theme.colorLevel4, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Get.theme.colorLevel4.withOpacity(0.6),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          title,
                          style: Get.theme.kSubTitleTextStyle.copyWith(
                            color: Get.theme.colorLevel4,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: Get.theme.kBodyTextStyle.copyWith(
                          color: Get.theme.colorLevel4,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            top: 20,
            child: Image.asset(
              'assets/icons/person_Icon.png',
              width: 85,
              height: 85,
            ),
          ),

          Positioned(
            right: -20,
            top: 35,
            child: Image.asset(
              'assets/icons/arrowIcon.png',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}

