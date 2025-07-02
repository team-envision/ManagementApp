import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';
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
        title: Text(Text_string.registrationTitle, style: Get.theme.kTitleTextStyle),
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
                          Text_string.studentDetailsTitle,
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
                              labelText: Text_string.nameLabelCaps,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.enterName;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildTextField(
                              labelText: Text_string.registrationNoLabelCaps,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.enterRegistrationNo;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildDropdownButtonFormField(
                              labelText: Text_string.designationLabelCaps,
                              items: Text_string.designationList,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.selectDesignation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildTextField(
                              labelText: Text_string.departmentLabelCaps,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.enterDepartment;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildDropdownButtonFormField(
                              labelText: Text_string.divisionLabelCaps,
                              items: Text_string.divisionList,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.selectDivision;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildTextField(
                              labelText: Text_string.netIdLabelCaps,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.enterNetId;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            buildTextField(
                              labelText: Text_string.phNoLabel,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Text_string.enterPhNo;
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
                        Text_string.enrollButton,
                        style: Get.theme.kSmallTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(KImages.loginIcon),
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
