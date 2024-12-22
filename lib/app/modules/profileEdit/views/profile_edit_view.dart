import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

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
                  theme.colorLevel1,
                  theme.colorLevel0,
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
                            icon: Icon(Icons.arrow_back_ios,
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
                            backgroundImage:
                                AssetImage('assets/images/profile_icon.png'),
                            backgroundColor: theme.colorLevel3,
                          ),
                        ),
                        Positioned(
                          //edit icon can be removed
                          top: 190,
                          right: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorPrimary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.edit,
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
          'Name: ${controller.nameController.text}', // Displaying updated name
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 20),
        Text(
          'Gender: ${controller.selectedGender.value ?? " "}', // Displaying updated gender
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 20),
        Text(
          'Email: ${controller.emailController.text}', // Displaying updated email
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 20),
        Text(
          'Year: ${controller.selectedYear.value ?? " "}', // Displaying updated year
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 20),
        Text(
          'Registeration No. : ${controller.regNoController.text}', // Displaying updated registration number
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 20),
        Text(
          'Phone No. : ${controller.phoneController.text}', // Displaying updated phone number
          style: theme.kTitleTextStyle
              .copyWith(fontSize: 20, color: theme.colorPrimary),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: controller.toggleEditMode,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorLevel2,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Edit Profile',
              style: theme.kTitleTextStyle.copyWith(
                color: theme.colorLevel3,
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
              labelText: 'Name',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.regNoController,
            decoration: InputDecoration(
              labelText: 'Registeration No.',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              labelText: 'Phone No.',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
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
              labelText: 'Gender',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
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
              labelText: 'Year',
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorPrimary,
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
                backgroundColor: theme.colorLevel2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Update',
                style: theme.kTitleTextStyle.copyWith(
                  color: theme.colorLevel3,
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
