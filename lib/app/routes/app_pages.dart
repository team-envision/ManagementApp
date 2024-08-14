import 'package:get/get.dart';

import '../modules/LoginView/bindings/login_view_binding.dart';
import '../modules/LoginView/views/login_view_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_VIEW,
      page: () => const LoginViewView(),
      binding: LoginViewBinding(),
    ),
  ];
}
