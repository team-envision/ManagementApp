import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';

class OrganizersView extends GetView {
  RxBool isChecked = false.obs;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                  itemCount: 5,
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
                              child:
                              _CheckBox(),
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
                  child: TextButton(onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("UPDATE",style: Get.theme.kSubTitleTextStyle),
                          SizedBox(width: 10),
                          Container(child: Image.asset('assets/images/Update.png')),
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

class _CheckBox extends StatelessWidget {
  _CheckBox({super.key});
  RxBool isChecked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return  CheckboxListTile(
        activeColor: Color.fromRGBO(62, 201, 207, 1),
        value: isChecked.value,
        onChanged: (val) {
          print(isChecked.value);
          print(val);
          isChecked.value = val!;
          print(isChecked.value);


        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Get.theme.colorLevel4,),
            SizedBox(width: 10),
            Text('NAME : ', style: Get.theme.kBodyTextStyle),
          ],
        ),
      );
    });
  }
}