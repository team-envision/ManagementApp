import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/markAttendanceView/views/heads_view.dart';
import 'package:managment_app/app/modules/markAttendanceView/views/members_view.dart';
import 'package:managment_app/app/modules/markAttendanceView/views/organizers_view.dart';
import 'package:managment_app/app/modules/markAttendanceView/views/volunteers_view.dart';

import '../controllers/mark_attendance_view_controller.dart';

class MarkAttendanceView extends GetView<MarkAttendanceViewController> {
  const MarkAttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.theme.colorLevel1,
          title: Text('ATTENDANCE',
              style: Get.theme.kTitleTextStyle),foregroundColor: Get.theme.colorLevel0,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(color: Color.fromRGBO(158, 161, 174, 1),height: 30,
              child: TabBar(
                labelPadding: EdgeInsets.all(0.8),
                unselectedLabelColor: Get.theme.colorLevel0,
                labelColor: Get.theme.colorLevel0,
                indicator: BoxDecoration(
                  color: Get.theme.colorLevel4,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(90),
                ),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 3.0),
                indicatorColor: Get.theme.colorLevel4,
                dividerColor: Colors.transparent,
                isScrollable: false,padding: EdgeInsets.symmetric(horizontal: 10),
                tabs: [

                  Tab(text: ' organizers '),
                  Tab(text: ' heads '),
                  Tab(text: ' members '),
                  Tab(text: ' volunteers '),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [OrganizersView(),HeadsView(),MembersView(),VolunteersView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
