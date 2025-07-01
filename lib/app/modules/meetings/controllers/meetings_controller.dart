import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants/text_strings.dart';

final List<String> domainOptions = Text_string.domainOptions;

RxInt currentIndex = 0.obs;

final List<String> forOptions = Text_string.forOptions;
final List<String> modeOptions = Text_string.modeOptions;

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

  // Observable for meeting description
  var description = ''.obs;

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    dateController.text = '${date.year}-${date.month}-${date.day}';
  }

  void updateSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
    timeController.text = '${time.hour}:${time.minute}';
  }

  // Function to show the dialog and update the description
  void showDescriptionDialog(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: Theme.of(context).copyWith(
          dialogBackgroundColor: const Color (0xFF002431),
        ),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            Text_string.addMeetingDescriptionTitle,
            style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: Text_string.enterMeetingDescriptionHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                Text_string.cancel,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (descriptionController.text.trim().isNotEmpty) {
                  description.value = descriptionController.text.trim();
                }
                Get.back();
              },
              child: const Text(
                Text_string.done,
                style: TextStyle( color:Colors.cyan, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        );
      },
    );
  }
}
