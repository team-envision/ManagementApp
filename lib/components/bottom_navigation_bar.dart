import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  BottomNavBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(KIcons.home,
              color:
              selectedIndex == 0 ? Get.theme.brightCyan : Get.theme.lightGrey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(KIcons.addBox,
              color:
              selectedIndex == 1 ? Get.theme.brightCyan : Get.theme.lightGrey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(KIcons.person,
              color:
              selectedIndex == 2 ? Get.theme.brightCyan : Get.theme.lightGrey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(KIcons.settings,
              color:
              selectedIndex == 3 ? Get.theme.brightCyan : Get.theme.lightGrey),
          label: '',
        ),
      ],
      backgroundColor: Get.theme.deepBlack,
      selectedItemColor: Get.theme.brightCyan,
      unselectedItemColor: Get.theme.lightGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}