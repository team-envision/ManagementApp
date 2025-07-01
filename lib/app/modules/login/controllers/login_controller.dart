import 'package:get/get.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

class LoginViewController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;




  var passwordVisible = false.obs;
  var selectedOption = ''.obs;




  void togglePasswordVisibility() {
  passwordVisible.value = !passwordVisible.value;
  }

  void setSelectedOption(String? option) {
  if (option != null) {
  selectedOption.value = option;
  }
  }

  List<String> get options => Text_string.optionsCDT;
  }


