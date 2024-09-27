import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import '../../../../components/teamTile.dart';
import '../controllers/team_page_controller.dart'; // Import the TeamTile component

class TeamPageView extends GetView<TeamPageController> {
  const TeamPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background gradient image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.image.gradient.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 85.0),
              Center(
                child: Text(
                  'MY TEAM',
                  style: Get.theme.kTitleTextStyle.copyWith(
                    color: Get.theme.colorLevel4,
                    fontSize: 22,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Organizers tile
              TeamTile(
                title: 'ORGANIZERS',
                subtitle: '5 members',
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Organizers');
                },
              ),
              // Heads tile
              TeamTile(
                title: 'HEADS',
                subtitle: '8 members',
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Heads');
                },
              ),
              // Members tile
              TeamTile(
                title: 'MEMBERS',
                subtitle: '11 members',
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Members');
                },
              ),
              // Volunteers tile
              TeamTile(
                title: 'VOLUNTEERS',
                subtitle: '20 members',
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Volunteers');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
