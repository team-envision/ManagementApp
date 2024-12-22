import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  BottomNavBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color:
              selectedIndex == 0 ? theme.colorPrimary : theme.colorLevel3),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box,
              color:
              selectedIndex == 1 ? theme.colorPrimary : theme.colorLevel3),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color:
              selectedIndex == 2 ? theme.colorPrimary : theme.colorLevel3),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,
              color:
              selectedIndex == 3 ? theme.colorPrimary : theme.colorLevel3),
          label: '',
        ),
      ],
      backgroundColor: theme.colorLevel0,
      selectedItemColor: theme.colorPrimary,
      unselectedItemColor: theme.colorLevel3,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}