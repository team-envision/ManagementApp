import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../../../routes/app_pages.dart';
import '../controllers/mark_attendance_view_controller.dart';

class OrganizersView extends GetView<MarkAttendanceViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Get.theme.darkBlue,
                  Get.theme.darkTeal,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 1.0])),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
              itemCount: controller.names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Get.theme.fadedWhite),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Get.theme.deepBlack,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: _CheckBox(
                              name: controller.names[index],
                              profile: KText.sampleProfile),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14),
                    color: Get.theme.darkBlue,
                  ),
                  height: Get.height * 0.05,
                  width: Get.width * 0.35,
                  child: TextButton(
                      onPressed: () {
                        Get.snackbar(
                          'Attendance Updated',
                          'Attendance has been Updated successfully',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Get.theme.lighterGrey,
                          colorText: Get.theme.pureBlack,
                          icon: Icon(KIcons.checkCircle, color: Get.theme.primaryGreen),
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
                          Text(KText.updateButton,
                              style: Get.theme.kSubTitleTextStyle),
                          const SizedBox(width: 10),
                          Container(child: Image.asset(KImages.update)),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  RxBool isChecked = false.obs;
  final String name;
  final String profile;

  _CheckBox({
    required this.name,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MarkAttendanceViewController>();
    return Obx(() {
      return CheckboxListTile(
        activeColor: Get.theme.brightCyan,
        value: isChecked.value,
        onChanged: (val) {
          if (val == true) {
            controller.checkedTiles.add(name);
          } else {
            controller.checkedTiles.remove(name);
          }
          isChecked.value = val!;
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Get.theme.fadedWhite,
            ),
            SizedBox(width: 10),
            Text(name + ' : ', style: Get.theme.kSmallTextStyle),
          ],
        ),
      );
    });
  }
}
