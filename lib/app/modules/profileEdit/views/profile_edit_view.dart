import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/app/modules/profileEdit/controllers/profile_edit_controller.dart';
import '../../../../Themes/themes.dart';

class ProfileEditView extends StatelessWidget {
  final ProfileEditController controller = Get.put(ProfileEditController());
  final _formKey = GlobalKey<FormState>(); // Create a form key

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
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
                SizedBox(height: 50),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 550,
                        height: 300,
                        decoration: BoxDecoration(
                          color: theme.colorLevel2,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: theme.dayNight),
                          onPressed: () => controller.goBack(),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          'Edit Profile',
                          style: theme.kSubTitleTextStyle,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/profile_icon.png'),
                          backgroundColor: theme.colorLevel3,
                        ),
                      ),
                      Positioned(
                        top: 190,
                        right: 140,
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
                SizedBox(height: 30),

                // Basic Information Banner
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: theme.colorLevel2,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'BASIC INFORMATION',
                    style: theme.kTitleTextStyle.copyWith(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),

                // Form for Input Fields
                Form(
                  key: _formKey, // Assign the form key
                  child: Column(
                    children: [
                      // Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: UnderlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_forward_ios),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when not focused
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when focused
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Gender Field
                      Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedGender.value,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when not focused
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when focused
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedGender(newValue);
                          }
                        },
                        items: controller.genders.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                      SizedBox(height: 10),

                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: UnderlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_forward_ios),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when not focused
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when focused
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.isEmail) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when not focused
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when focused
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: Icon(Icons.arrow_forward_ios),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Year Field
                      Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedYear.value,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when not focused
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorPrimary, // Custom underline color when focused
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your year';
                          }
                          return null;
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedYear(newValue);
                          }
                        },
                        items: controller.years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                      SizedBox(height: 10),

                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process the data
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorLevel2,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 12),
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
                    ],
                  ),
                ),
                SizedBox(height: 20), // Added closing for Column inside Form
              ],
            ),
          ),
        ),
      ),
    );
  }
}


