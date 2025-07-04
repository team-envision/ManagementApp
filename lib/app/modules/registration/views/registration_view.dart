import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';
import '../../../../components/kDropDownButton.dart';
import '../../../../components/kTextField.dart';
import '../../../routes/app_pages.dart';

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
        backgroundColor: Get.theme.darkBlue,
        centerTitle: true,
        title: Text(Text_string.registrationTitle, style: Get.theme.kTitleTextStyle),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Get.theme.darkBlue,
                    Get.theme.darkTeal,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 1.0])),
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
                              color: Get.theme.deepBlack,
                              spreadRadius: 5,
                            )
                          ],
                          color: Get.theme.darkTeal,
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
                        backgroundColor: Get.theme.lighterGrey,
                        colorText: Get.theme.pureBlack,
                        icon: Icon(KIcons.checkCircle, color: Get.theme.primaryGreen),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 2),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.toNamed(Routes.HOME);
                      });
                    } else {
                      // If there are validation errors
                      Get.snackbar(
                        'Validation Error',
                        'Please fill all fields correctly',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Get.theme.lightRed,
                        colorText: Get.theme.pureWhite,
                        icon: Icon(KIcons.error, color: Get.theme.pureWhite),
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 4),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.darkBlue,
                    alignment: Alignment.center,
                    fixedSize: const Size(137, 0),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Text_string.enrollButton,
                        style: Get.theme.kVerySmallTextStyle,
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
