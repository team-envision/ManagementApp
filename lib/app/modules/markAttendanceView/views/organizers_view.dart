import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/teamAttendance/views/team_attendance_view.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/mark_attendance_view_controller.dart';

class OrganizersView extends GetView<MarkAttendanceViewController> {

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Get.theme.colorLevel1,
                Get.theme.colorLevel2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 1.0]
          )
      ),
      child: Column(
        children: [
          SizedBox(height:30),
          Expanded(
              child: ListView.builder(
                itemCount: controller.names.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child:  Container(
                        decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),color: Get.theme.colorLevel4),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Get.theme.colorLevel0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: _CheckBox(name: controller.names[index],profile: Text_string.sampleProfile),
                          ),
                        ),
                      ),
                    ),
                  );
                },)
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align
              (
              alignment: Alignment.bottomCenter,
              child:
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(14),
                  color: Get.theme.colorLevel1,
                ),
                height: Get.height*0.05,
                width: Get.width*0.35,
                child: TextButton(onPressed: () {
                  Get.snackbar(
                    'Attendance Updated',
                    'Attendance has been Updated successfully',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.grey[300],
                    colorText: Colors.black,
                    icon: Icon(KIcons.checkCircle, color: Colors.green),
                    margin: const EdgeInsets.all(10),
                    duration: const Duration(seconds: 1),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.toNamed(Routes.HOME);
                  });
                },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Text_string.updateButton,style: Get.theme.kSubTitleTextStyle),
                        SizedBox(width: 10),
                        Container(child: Image.asset(KImages.update)),
                      ],
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}

class _CheckBox extends StatelessWidget{
  RxBool isChecked = false.obs;
  final String name;
  final String profile;

  _CheckBox({required this.name,required this.profile,});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MarkAttendanceViewController>();
    return Obx((){
      return  CheckboxListTile(
        activeColor: Color.fromRGBO(62, 201, 207, 1),
        value: isChecked.value,
        onChanged: (val) {
          if(val == true){
            controller.checkedTiles.add(name);
          }
          else{
            controller.checkedTiles.remove(name);

          }
          isChecked.value = val!;
        },

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Get.theme.colorLevel4,),
            SizedBox(width: 10),
            Text(name+' : ', style: Get.theme.kBodyTextStyle),
          ],
        ),
      );
    });
  }
}