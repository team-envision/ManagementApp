import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isEditing = true.obs;

  // TextEditingControllers for editable fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final regNoController = TextEditingController();
  final phoneController = TextEditingController();

  var selectedGender = Rxn<String>();
  List<String> get genders => ["Male", "Female", "Others"];

  var selectedYear = Rxn<String>();
  List<String> get years => ["1st", "2nd", "3rd", "4th", "5th"];

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