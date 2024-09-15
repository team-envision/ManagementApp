import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorLevel1,
        centerTitle: true,
        title: Text(
            'REGISTRATION',
            style: Get.theme.kTitleTextStyle ),
        elevation: 0,
      ),
      body :SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Get.theme.colorLevel1,
                    Get.theme.colorLevel2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1.0]
              )
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'STUDENT DETAILS',
                          style: Get.theme.kSubTitleTextStyle,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Get.theme.colorLevel0,
                              spreadRadius: 5,
                            )
                          ],
                          color: Get.theme.colorLevel2, // Match the container background color
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            _buildTextField('NAME:'),
                            SizedBox(height: 30),
                            _buildTextField('REGISTRATION NO:'),
                            SizedBox(height: 30),
                            _buildDropdownButtonFormField('DESIGNATION:', ['VOLUNTEER', 'COMMITTEE MEMBER ', 'COMMITTEE HEAD','ORGANIZER']),
                            SizedBox(height: 30),
                            _buildTextField('DEPARTMENT:'),
                            SizedBox(height: 30),
                            _buildDropdownButtonFormField('DIVISION:', ['A', 'B', 'C']),//IDK what to put in designation
                            SizedBox(height: 30),
                            _buildTextField('NET ID:'),
                            SizedBox(height: 30),
                            _buildTextField('Ph no:'),
                            SizedBox(height: 30),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('ENROLL', style: Get.theme.kSmallTextStyle,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.colorLevel1,
                  ),
                  icon: Icon(Icons.arrow_circle_right_rounded,
                    color: Get.theme.colorLevel4,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(String labelText) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Get.theme.colorLevel0,
            spreadRadius: 2,
          )
        ],
      ),
      child: TextField(style: TextStyle(
          color: Get.theme.colorLevel0),
        decoration: InputDecoration(
          fillColor: Get.theme.colorLevel4,
          labelText: labelText,
          labelStyle: TextStyle(color: Get.theme.colorLevel0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonFormField(String labelText, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Get.theme.colorLevel0,
            spreadRadius: 2,
          )
        ],
      ),
      child: DropdownButtonFormField<String>(
        iconEnabledColor: Get.theme.colorLevel0,
        iconDisabledColor: Get.theme.colorLevel0,
        dropdownColor: Get.theme.colorLevel4,
          decoration: InputDecoration(
            fillColor: Get.theme.colorLevel4,
            labelText: labelText,
            labelStyle: TextStyle(color: Get.theme.colorLevel0),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item,style: TextStyle(color: Get.theme.colorLevel0),),
          ))
              .toList(),
          onChanged: (value) {},
          ),
    );
    }
}