import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';



class CustomDropdownButton extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final RxString selectedValue;

  const CustomDropdownButton({super.key, 
    required this.hintText,
    required this.options,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Obx(
            () => Container(
          padding: const EdgeInsets.symmetric(horizontal:1.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Get.theme.kInputFieldTextStyle2,
              filled: true,
              fillColor: Get.theme.pureWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: Get.theme.kInputFieldTextStyle2),
              );
            }).toList(),
            onChanged: (value) => selectedValue.value = value!,
            icon: Icon(KIcons.dropDowArrow, color: Get.theme.pureBlack, size: 24),
          ),
        ),
      ),
    );
  }
}