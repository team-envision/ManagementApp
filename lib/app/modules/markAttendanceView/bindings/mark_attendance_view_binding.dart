import 'package:get/get.dart';

import '../controllers/mark_attendance_view_controller.dart';

class MarkAttendanceViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarkAttendanceViewController>(
      () => MarkAttendanceViewController(),
    );
  }
}
