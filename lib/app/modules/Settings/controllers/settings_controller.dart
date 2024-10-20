import 'package:get/get.dart';

class SettingsController extends GetxController {

  var isProfileExpanded = false.obs;

  void toggleProfileExpansion() {
  isProfileExpanded.value = !isProfileExpanded.value;
  }



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
}
