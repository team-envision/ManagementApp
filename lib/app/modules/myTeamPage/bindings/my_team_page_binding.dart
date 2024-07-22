import 'package:get/get.dart';

import '../controllers/my_team_page_controller.dart';

class MyTeamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTeamPageController>(
      () => MyTeamPageController(),
    );
  }
}
