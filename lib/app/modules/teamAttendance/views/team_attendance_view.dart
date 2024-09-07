import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';

import '../controllers/team_attendance_controller.dart';

class TeamAttendanceView extends GetView<TeamAttendanceController> {
  const TeamAttendanceView({super.key});


  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Container(padding: const EdgeInsets.all(5),child: Image.asset('assets/images/icon.png'),),
            onPressed: () {},
          ),
          backgroundColor: Get.theme.colorLevel1,
          title: Text('MY TEAM',
              style: Get.theme.kTitleTextStyle),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Get.theme.colorLevel1,
                    Get.theme.colorLevel2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 1.0]
              )
          ),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: SizedBox(
                    height: screenHeight * 0.05,
                    width: screenWidth,
                    child: TextField(
                      style: GoogleFonts.raleway(textStyle: TextStyle(color: Get.theme.colorLevel0)),
                      decoration: InputDecoration(contentPadding: const EdgeInsets.all(2),
                        prefixIcon: Icon(Icons.search, color: Get.theme.colorLevel0),
                        hintText: 'Search...',
                        hintStyle: GoogleFonts.raleway(textStyle: TextStyle(color: Get.theme.colorLevel0)),
                        filled: true,
                        fillColor: Get.theme.colorLevel4,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child:  Container(
                            decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),color: Get.theme.colorLevel4),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ExpansionTile(
                                tilePadding: const EdgeInsets.all(8.0),
                                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                title: Text('Name : ', style: Get.theme.kSubTitleTextStyle),
                                backgroundColor: Get.theme.colorLevel0,
                                collapsedBackgroundColor: Get.theme.colorLevel0,
                                leading: CircleAvatar(backgroundColor: Get.theme.colorLevel4,),
                                children: [
                                  ListTile(title: Text('ID No. :', style: Get.theme.kBodyTextStyle)),
                                  ListTile(title: Text('Domain :', style: Get.theme.kBodyTextStyle)),
                                  ListTile(title: Text('Total meets conducted :', style: Get.theme.kBodyTextStyle)),
                                  ListTile(title: Text('No. of meets attended :', style: Get.theme.kBodyTextStyle)),
                                  ListTile(title: Text('No. of absences :', style: Get.theme.kBodyTextStyle)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },)
              )
            ],
          ),
        ),
    );
  }
}
