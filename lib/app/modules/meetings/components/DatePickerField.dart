import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';


class DatePickerField extends StatelessWidget {
  final String hintText;
  final Rx<DateTime> selectedDate;
  final Function(DateTime) onDateChanged;

  const DatePickerField({super.key, 
    required this.hintText,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Get.theme.lightTransparentBlack),
          filled: true,
          fillColor: Get.theme.pureWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          suffixIcon: Icon(KIcons.dropDowArrow, color: Get.theme.pureBlack,),
        ),
        readOnly: true,
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate.value,
            firstDate: DateTime(2015),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != selectedDate.value) {
            onDateChanged(picked);
          }
        },
        controller: TextEditingController(text: '${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}'),

          style: TextStyle(color: Get.theme.darkGrey),),
    );
  }
}