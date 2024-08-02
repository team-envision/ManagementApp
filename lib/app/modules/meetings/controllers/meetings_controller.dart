import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> domainOptions = [
  'Robogyan', 'Yuddhame', 'Online', 'Magefficie and Start-Ups', 'Fundaz',
  'Vimanaz', 'Konstruktion', 'Architecture', 'Bluebook', 'Praesentio',
  'Machination', 'Electrizite', 'Digital Design', 'X-Zone'
];


final List<String> forOptions = ['Volunteer', 'Member', 'Head'];


final List<String> modeOptions = ['Online', 'Offline'];

class MeetingsController extends GetxController {
  var domainSelectedValue = ''.obs;
  var forSelectedValue = ''.obs;
  var dateSelectedValue = ''.obs;
  var timeSelectedValue = ''.obs;
  var modeSelectedValue = ''.obs;

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  var selectedDate = Rx<DateTime>(DateTime.now());
  var selectedTime = Rx<TimeOfDay>(TimeOfDay.now());

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    dateController.text = '${date.year}-${date.month}-${date.day}';
  }

  void updateSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
    timeController.text = '${time.hour}:${time.minute}';
  }
}
