  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:managment_app/Themes/themes.dart';
  import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/strings.dart';
  import '../controllers/mark_attendance_view_controller.dart';

  class VolunteersView extends GetView<MarkAttendanceViewController> {
  const VolunteersView({super.key});


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
                  stops: const [0.2, 1.0]
              )
          ),
          child: Column(
            children: [
              const SizedBox(height:30),
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
                                child: _CheckBox(name: controller.names[index],profile: KStrings.sampleProfile),
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
                        icon: const Icon(Icons.check_circle, color: Colors.green),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 1),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Get.to(() => const HomeView());
                      });
                    },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(KStrings.updateButton,style: Get.theme.kSubTitleTextStyle),
                            const SizedBox(width: 10),
                            Image.asset(KImages.update),
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

  class _CheckBox extends StatefulWidget{
    final String name;
    final String profile;

    const _CheckBox({required this.name,required this.profile,});

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
    RxBool isChecked = false.obs;

    @override
    Widget build(BuildContext context) {
      final controller = Get.find<MarkAttendanceViewController>();
      return Obx((){
        return  CheckboxListTile(
          activeColor: const Color.fromRGBO(62, 201, 207, 1),
          value: isChecked.value,
          onChanged: (val) {
            if(val == true){
              controller.checkedTiles.add(widget.name);
            }
            else{
              controller.checkedTiles.remove(widget.name);

            }
            isChecked.value = val!;
          },

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          title: Row(
            children: [
              CircleAvatar(backgroundColor: Get.theme.colorLevel4,),
              const SizedBox(width: 10),
              Text('${widget.name} : ', style: Get.theme.kBodyTextStyle),
            ],
          ),
        );
      });
    }
}