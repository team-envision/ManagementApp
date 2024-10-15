import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:managment_app/Themes/themes.dart';
import '../../../../components/kDropDownButton.dart';
import '../../../../components/kTextField.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  // Create a GlobalKey for the Form
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorLevel1,
        centerTitle: true,
        title: Text('REGISTRATION', style: Get.theme.kTitleTextStyle),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Get.theme.colorLevel1,
                    Get.theme.colorLevel2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1.0])),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            'STUDENT DETAILS',
                            style: Get.theme.kSubTitleTextStyle,
                          ),
                        ),
                        const SizedBox(height: 20),
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
                            color: Get.theme.colorLevel2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              buildTextField(
                                labelText: 'NAME:',
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.isNAME) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildTextField(
                                labelText: 'REGISTRATION NO:',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter registration number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildDropdownButtonFormField(
                                labelText: 'DESIGNATION:',
                                items: [
                                  'VOLUNTEER',
                                  'COMMITTEE MEMBER',
                                  'COMMITTEE HEAD',
                                  'ORGANIZER'
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a designation';
                                  } else
                                    return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildTextField(
                                labelText: 'DEPARTMENT:',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your department';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildDropdownButtonFormField(
                                labelText: 'DIVISION:',
                                items: ['A', 'B', 'C'],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a division';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildTextField(
                                labelText: 'NET ID:',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your net ID';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildTextField(
                                labelText: 'Ph no:',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.colorLevel1,
                    alignment: Alignment.center,
                    fixedSize: const Size(137, 0),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: Get.theme.kSmallTextStyle,
                        'ENROLL',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/Login.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
