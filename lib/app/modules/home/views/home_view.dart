import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/app/modules/dashboard/view/dashboard_view.dart';
import 'package:managment_app/app/modules/teamPage/views/team_page_view.dart';
import '../../../../components/bottom_navigation_bar.dart';
import '../../Settings/views/settings_view.dart';
import '../../meetings/views/meetings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => currentIndex.value = index,
        children: [
          const DashboardView(), // Content for the Home tab
          MeetingsView(),
          const TeamPageView(), // Profile content
          const SettingsView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          selectedIndex: currentIndex.value,
          onTap: (index) {
            currentIndex.value = index;
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
