
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/app/modules/login/controllers/login_controller.dart';

import '../../../../Themes/themes.dart';

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
                  theme.colorLevel1, // Dark blue color
                  theme.colorLevel0, // Black color
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
                        'assets/images/aaruush.png',
                        width: 300,
                        height: 300,
                      ),


                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: theme.colorLevel1,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: SizedBox(height: 75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,),
                                child: Image.asset(
                                  'assets/icons/mail.png',
                                  width: 28,
                                  height: 28,),
                              ),
                              hintText: 'Email',

                              hintStyle: const TextStyle(color: Colors.grey,fontSize: 19,),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,

                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(top: 50),
                            ),
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty ||
                                  !value.isEmail) {
                                return '       Email is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Password TextField with Shadow
                      Obx(() =>
                          SizedBox(
                            child: Container(
                              width: 450,
                              height: 70,
                              decoration: BoxDecoration(
                                color: theme.colorLevel1,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
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
                                    padding: const EdgeInsets.symmetric(vertical: 9),
                                    child: Image.asset(
                                      'assets/icons/lock.png', // Assuming you have a lock icon here
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),  contentPadding: const EdgeInsets.only(top: 50),
                                  hintText: 'Password',

                                  hintStyle: const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  suffixIcon: IconButton(
                                    icon: SizedBox(
                                      width: 30,  // Increase the size of the icon
                                      height: 30, // Increase the size of the icon
                                      child: Icon(
                                        controller.passwordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 28,  // Set the size of the icon
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.togglePasswordVisibility();
                                    },
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '      Password is required';
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
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Dropdown for Committee, Domain, Team with Shadow and Custom Dropdown Color
                      Obx(() =>
                          Container(
                            width: Get.width,
                            height: 70,
                            decoration: BoxDecoration(
                              color: theme.colorLevel1,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
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
                              dropdownColor: theme.colorLevel1,
                              hint: const Text(
                                'Select Committee, Domain, or Team',
                                style: TextStyle(color: Colors.grey,fontSize: 14,),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              items: controller.options.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option, style: const TextStyle(
                                      color: Colors.white),
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
                                  return 'Please select an option';
                                }

                              },
                            ),
                          )),
                      const SizedBox(height: 80),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Perform login action
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: theme.colorPrimary, width: 2),
                          ),
                        ),
                        child: Text(
                          'LOGIN',
                          style: theme.kTitleTextStyle.copyWith(
                            color: theme.colorPrimary,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}