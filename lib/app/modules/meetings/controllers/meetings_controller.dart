import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants/strings.dart';

final List<String> domainOptions = KStrings.domainOptions;

RxInt currentIndex = 0.obs;

final List<String> forOptions = KStrings.forOptions;
final List<String> modeOptions = KStrings.modeOptions;

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
            KStrings.addMeetingDescriptionTitle,
            style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: KStrings.enterMeetingDescriptionHint,
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
                KStrings.cancel,
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
                KStrings.done,
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
