import 'package:get/get.dart';

import 'package:managment_app/app/modules/dashboard/binding/dashboard_binding.dart';
import 'package:managment_app/app/modules/dashboard/view/dashboard_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import 'package:managment_app/app/modules/login/views/login_view.dart';
import '../modules/login/bindings/login_binding.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';





part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const INITIAL = Routes.LOGIN_VIEW;



  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MEETINGS,
      page: () => const MeetingsView(),
      binding: MeetingsBinding(),
    ),

  GetPage(
      name: _Paths.TEAM_ATTENDANCE,
      page: () => const TeamAttendanceView(),
      binding: TeamAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_VIEW,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
