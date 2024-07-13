import 'package:get/get.dart';

import '../controllers/team_attendance_controller.dart';

class TeamAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamAttendanceController>(
      () => TeamAttendanceController(),
    );
  }
}
