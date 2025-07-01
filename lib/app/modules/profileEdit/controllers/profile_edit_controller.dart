import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

class ProfileEditController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isEditing = true.obs;

  // TextEditingControllers for editable fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final regNoController = TextEditingController();
  final phoneController = TextEditingController();

  var selectedGender = Rxn<String>();
  List<String> get genders => Text_string.genders;

  var selectedYear = Rxn<String>();
  List<String> get years => Text_string.years;

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void saveProfile() {
    // Logic to save profile data
    toggleEditMode();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}