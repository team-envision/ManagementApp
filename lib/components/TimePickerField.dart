import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

import '../utilities/constants/icons_const.dart';

class TimePickerField extends StatelessWidget {
  final String hintText;
  final Rx<TimeOfDay> selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimePickerField({super.key, 
    required this.hintText,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(
            () {
          controller.text = '${selectedTime.value.hour}:${selectedTime.value.minute}';
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Get.theme.darkGrey, fontWeight: FontWeight.w300),
                filled: true,
                fillColor: Get.theme.pureWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                suffixIcon: IconButton(
                  icon: Icon(KIcons.dropDowArrow, color: Get.theme.pureBlack),
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTime.value,
                    );
                    if (picked != null) {
                      selectedTime.value = picked;
                      onTimeChanged(picked);
                    }
                  },
                ),
              ),
              controller: controller,
              readOnly: true,
              style: TextStyle(color: Get.theme.darkGrey, fontWeight: FontWeight.w400),
            ),
          );
        },
      ),
    );
  }
}