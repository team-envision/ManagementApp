import 'package:get/get.dart';

class LoginViewController extends GetxController {
  // TODO: Implement LoginViewController

  final count = 0.obs;
  var passwordVisible = false.obs;
  var selectedOption = ''.obs;




  void increment() => count.value++;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void setSelectedOption(String? option) {
    if (option != null) {
      selectedOption.value = option;
    }
  }

  List<String> get options => ['Committe', 'Domain', 'Team'];
}
