import 'package:get/get.dart';

import '../controller/dasboard_controller.dart';
import '../controller/dashboard_controller.dart';



class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
  }
}
