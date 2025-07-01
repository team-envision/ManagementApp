import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/routes/app_pages.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';
import '../../../../components/team_tile.dart';
import '../controllers/team_page_controller.dart';

class TeamPageView extends GetView<TeamPageController> {
  const TeamPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorLevel1, theme.colorLevel0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              KImages.ellipse3,
              width: 300,
              height: 500,
              color: Get.theme.colorLevel2,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Center(
                  child: Text(
                    Text_string.myTeamButton,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Get.theme.colorLevel4,
                      fontSize: 25,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TeamTile(
                  title: Text_string.organizerTeamTile,
                  subtitle: Text_string.sampleOrganizers,
                  onTap: () {
                    Get.toNamed(Routes.TEAM_ATTENDANCE, arguments: 'Organizers');
                  },
                ),
                const SizedBox(height: 20),
                TeamTile(
                  title: Text_string.headsTeamTile,
                  subtitle: Text_string.sampleHeads,
                  onTap: () {
                    Get.toNamed(Routes.TEAM_ATTENDANCE, arguments: 'Heads');
                  },
                ),
                const SizedBox(height: 20),
                TeamTile(
                  title: Text_string.membersTeamTile,
                  subtitle: Text_string.sampleMembers,
                  onTap: () {
                    Get.toNamed(Routes.TEAM_ATTENDANCE, arguments: 'Members');
                  },
                ),
                const SizedBox(height: 20),
                TeamTile(
                  title: Text_string.volunteersTeamTile,
                  subtitle: Text_string.sampleVolunteers,
                  onTap: () {
                    Get.toNamed(Routes.TEAM_ATTENDANCE, arguments: 'Volunteers');
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
