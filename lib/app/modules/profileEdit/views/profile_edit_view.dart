import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  ProfileEditView({super.key});

  final ProfileEditController controller = Get.put(ProfileEditController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.darkBlue,
                  theme.deepBlack,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 550,
                          height: 300,
                        ),
                        Positioned(
                          top: 5,
                          left: 10,
                          child: IconButton(
                            icon: Icon(KIcons.iosBackArrow,
                                color: theme.dayNight),
                            onPressed: () {
                              Get.back(); // Navigate back to the previous page
                            },
                          ),
                        ),
                        Positioned(
                          top: 100,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: const AssetImage(KImages.profileIcon),
                            backgroundColor: theme.lightGrey,
                          ),
                        ),
                        Positioned(
                          //edit icon can be removed
                          top: 190,
                          right: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.brightCyan,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                KIcons.edit,
                                color: theme.dayNight,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => controller.isEditing.value
                        ? _buildProfileDetails(context, theme)
                        : _buildEditableForm(context, theme),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${KText.nameDisplay}${controller.nameController.text}', // Displaying updated name
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 20),
        Text(
          '${KText.genderDisplay}${controller.selectedGender.value ?? " "}',
          // Displaying updated gender
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 20),
        Text(
          '${KText.emailDisplay}${controller.emailController.text}',
          // Displaying updated email
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 20),
        Text(
          '${KText.yearDisplay}${controller.selectedYear.value ?? " "}',
          // Displaying updated year
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 20),
        Text(
          '${KText.registrationNoDisplay}${controller.regNoController.text}',
          // Displaying updated registration number
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 20),
        Text(
          '${KText.phoneNoDisplay}${controller.phoneController.text}',
          // Displaying updated phone number
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.brightCyan),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: controller.toggleEditMode,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.darkTeal,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              KText.editProfileButton,
              style: theme.kTitleTextStyle.copyWith(
                color: theme.lightGrey,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableForm(BuildContext context, ThemeData theme) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              labelText: KText.nameLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: KText.emailLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.regNoController,
            decoration: InputDecoration(
              labelText: KText.registrationNoLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              labelText: KText.phoneNoLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: controller.selectedGender.value,
            items: controller.genders
                .map((gender) =>
                    DropdownMenuItem(value: gender, child: Text(gender)))
                .toList(),
            onChanged: controller.selectedGender,
            decoration: InputDecoration(
              labelText: KText.genderLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: controller.selectedYear.value,
            items: controller.years
                .map((year) => DropdownMenuItem(value: year, child: Text(year)))
                .toList(),
            onChanged: controller.selectedYear,
            decoration: InputDecoration(
              labelText: KText.yearLabel,
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.brightCyan,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.saveProfile();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.darkTeal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                KText.updateButtonSmall,
                style: theme.kTitleTextStyle.copyWith(
                  color: theme.lightGrey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
