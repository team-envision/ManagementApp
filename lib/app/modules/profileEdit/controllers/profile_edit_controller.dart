import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  //TODO: Implement ProfileEditController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  var selectedGender = Rxn<String>();
  void setSelectedGender(String gender) {
    if (gender != null) {
      selectedGender.value = gender;
    }
  }
  List<String> get genders => ["Male", "Female","Others"];

  var selectedYear = Rxn<String>();
  void setSelectedYear(String year) {
    if (year != null) {
      selectedYear.value = year;
    }
  }
  List<String> get years => ["1st", "2nd","3rd","4th","5th"];

  void goBack() {
    Get.back();
  }
}