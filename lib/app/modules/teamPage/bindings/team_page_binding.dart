import 'package:get/get.dart';

import '../controllers/team_page_controller.dart';

class TeamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamPageController>(
          () => TeamPageController(),
    );
  }
}