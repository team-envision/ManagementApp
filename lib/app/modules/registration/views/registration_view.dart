import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import '../../../../components/kDropDownButton.dart';
import '../../../../components/kTextField.dart';

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
                Padding(
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
                                if (value == null || value.isEmpty) {
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
                                }
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
                ElevatedButton.icon(
                  onPressed: () {
                    // Check if the form is valid
                    if (formKey.currentState?.validate() ?? false) {
                      // If all fields are valid
                      Get.snackbar(
                        'Enrolled Successfully',
                        'User has been enrolled successfully',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.grey[300],
                        colorText: Colors.black,
                        icon: Icon(Icons.check_circle, color: Colors.green),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 2),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.to(() => HomeView());
                      });
                    } else {
                      // If there are validation errors
                      Get.snackbar(
                        'Validation Error',
                        'Please fill all fields correctly',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red[300],
                        colorText: Colors.white,
                        icon: Icon(Icons.error, color: Colors.white),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 4),
                      );
                    }
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
                        'ENROLL',
                        style: Get.theme.kSmallTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/Login.png'),
                    ],
                  ),
                  icon: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
