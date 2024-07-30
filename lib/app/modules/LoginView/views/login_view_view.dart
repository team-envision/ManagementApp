import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_view_controller.dart';
import '../../../../Themes/themes.dart';

class LoginViewView extends GetView<LoginViewController> {
  const LoginViewView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme; // Access the current theme

    return Scaffold(
      body: Container(
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
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Custom Logo
                Container(
                  child: Image.asset(
                    'assets/images/aaruush.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 30),
                // Email TextField with Shadow
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorLevel1,
                    borderRadius: BorderRadius.circular(theme.kTextFieldBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                // Password TextField with Shadow
                Obx(() => Container(
                  decoration: BoxDecoration(
                    color: theme.colorLevel1,
                    borderRadius: BorderRadius.circular(theme.kTextFieldBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: !controller.passwordVisible.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
                const SizedBox(height: 20),
                // Forgot Password
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                // Dropdown for Committee, Domain, Team with Shadow and Custom Dropdown Color
                Obx(() => Container(
                  decoration: BoxDecoration(
                    color: theme.colorLevel1,
                    borderRadius: BorderRadius.circular(theme.kTextFieldBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: controller.selectedOption.value.isEmpty ? null : controller.selectedOption.value,
                    dropdownColor: theme.colorLevel1,
                    hint: const Text(
                      'Select Committee, Domain, or Team',
                      style: TextStyle(color: Colors.grey),
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
                        child: Text(option, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.setSelectedOption(newValue);
                    },
                  ),
                )),
                const SizedBox(height: 40),
                // Login Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(theme.kButtonBorderRadius),
                      side: BorderSide(color: theme.colorPrimary, width: 2),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: theme.kTitleTextStyle.copyWith(color: theme.colorPrimary),
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
