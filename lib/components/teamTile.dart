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
        clipBehavior: Clip.none, // Ensures elements outside the bounds aren't clipped
        children: [
          Container(
            clipBehavior: Clip.none, // Ensures the container doesn't clip the icons
            decoration: BoxDecoration(
              color: Get.theme.colorLevel2, // Using theme color
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Get.theme.colorLevel5, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Get.theme.colorLevel5.withOpacity(0.6),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0), // Increased padding to avoid overlap with icons
                child: Center( // Centering the text content
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically in the Column
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          title,
                          style: Get.theme.kSubTitleTextStyle.copyWith(
                            color: Get.theme.colorLevel4,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: Get.theme.kBodyTextStyle.copyWith(
                          color: Get.theme.colorLevel4,
                          fontSize: 11,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned person icon on the left edge
          Positioned(
            left: -40, // Adjusted to move icon slightly outside the tile
            top: 20, // Adjusted vertically to center the icon
            child: Image.asset(
              'assets/images/personIcon.png',
              width: 85,
              height: 85,
            ),
          ),
          // Positioned arrow icon on the right edge
          Positioned(
            right: -20, // Adjusted to move icon slightly outside the tile
            top: 35, // Adjusted vertically to center the icon
            child: Image.asset(
              'assets/images/arrowIcon.png',
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}


