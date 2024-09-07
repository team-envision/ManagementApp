import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isMeetExpanded = false.obs;

  void toggleMeetExpansion() {
    isMeetExpanded.value = !isMeetExpanded.value;
  }
}
