import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingsController extends GetxController {
  RxString dropdown1SelectedValue = ''.obs;
  RxString dropdown2SelectedValue = ''.obs;
  RxString dropdown3SelectedValue = ''.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    dateController.text = "${date.toLocal()}".split(' ')[0];
  }

  void updateSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
    timeController.text = time.format(Get.context!);
  }

  @override
  void onInit() {
    super.onInit();
    dateController.text = "${selectedDate.value.toLocal()}".split(' ')[0];
    timeController.text = selectedTime.value.format(Get.context!);
  }
}
