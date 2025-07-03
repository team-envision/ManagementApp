import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/app/modules/login/controllers/login_controller.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../../../../Themes/themes.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginViewController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.darkBlue, // Dark blue color
              theme.deepBlack, // Black color
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Custom Logo
                  Image.asset(
                    KImages.aaruushLogo,
                    width: 300,
                    height: 300,
                  ),

                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: theme.darkBlue,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Get.theme.fadedGrey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Image.asset(
                              KImages.mailIcon,
                              width: 28,
                              height: 28,
                            ),
                          ),
                          hintText: Text_string.emailHint,
                          hintStyle: theme.kLargeHintTextStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Get.theme.transparent,
                          contentPadding: const EdgeInsets.only(top: 50),
                        ),
                        style: theme.kInputFieldTextStyle,
                        textAlign: TextAlign.start,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.isEmail) {
                            return Text_string.emailRequired;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Password TextField with Shadow
                  Obx(() => SizedBox(
                        child: Container(
                          width: 450,
                          height: 70,
                          decoration: BoxDecoration(
                            color: theme.darkBlue,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Get.theme.fadedGrey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            obscureText: !controller.passwordVisible.value,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 9),
                                child: Image.asset(
                                  KImages.lockIcon,
                                  // Assuming you have a lock icon here
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(top: 50),
                              hintText: Text_string.passwordHint,
                              hintStyle: theme.kLargeHintTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Get.theme.transparent,
                              suffixIcon: IconButton(
                                icon: SizedBox(
                                  width: 30,
                                  // Increase the size of the icon
                                  height: 30,
                                  // Increase the size of the icon
                                  child: Icon(
                                    controller.passwordVisible.value
                                        ? KIcons.visibility
                                        : KIcons.visibilityOff,
                                    size: 28, // Set the size of the icon
                                  ),
                                ),
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                              ),
                            ),
                            style: theme.kInputFieldTextStyle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Text_string.passwordRequired;
                              }
                              return null;
                            },
                          ),
                        ),
                      )),
                  const SizedBox(height: 2),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        Text_string.forgotPassword,
                        style: theme.kLinkTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Dropdown for Committee, Domain, Team with Shadow and Custom Dropdown Color
                  Obx(() => Container(
                        width: Get.width,
                        height: 70,
                        decoration: BoxDecoration(
                          color: theme.darkBlue,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Get.theme.fadedGrey,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          value: controller.selectedOption.value.isEmpty
                              ? null
                              : controller.selectedOption.value,
                          dropdownColor: theme.darkBlue,
                          hint: Text(
                            Text_string.selectCDT,
                            style: theme.kDropdownHintTextStyle,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Get.theme.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: controller.options.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(
                                option,
                                style: theme.kInputFieldTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.setSelectedOption(newValue);
                            formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Text_string.pleaseSelectOption;
                            }
                          },
                        ),
                      )),
                  const SizedBox(height: 80),
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (true) {
                        Get.toNamed(Routes.HOME);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Get.theme.brightCyan, width: 2),
                      ),
                    ),
                    child: Text(
                      Text_string.loginButton,
                      style: theme.kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
