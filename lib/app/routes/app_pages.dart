import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';

import '../modules/meetings/bindings/meetings_binding.dart';
import '../modules/meetings/views/meetings_view.dart';

import '../modules/teamAttendance/bindings/team_attendance_binding.dart';
import '../modules/teamAttendance/views/team_attendance_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const INITIAL = Routes.REGISTRATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),

      name: _Paths.MEETINGS,
      page: () =>  MeetingsView(),
      binding: MeetingsBinding(),

      name: _Paths.TEAM_ATTENDANCE,
      page: () => TeamAttendanceView(),
      binding: TeamAttendanceBinding(),
    ),
  ];
}
