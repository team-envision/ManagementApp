import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

Widget buildDropdownButtonFormField({required String labelText, required List<String> items, required String? Function(dynamic value) validator,}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          color: Get.theme.deepBlack,
          spreadRadius: 2,
        )
      ],
    ),
    child: DropdownButtonFormField<String>(
      iconEnabledColor: Get.theme.deepBlack,
      iconDisabledColor: Get.theme.deepBlack,
      dropdownColor: Get.theme.fadedWhite,
      decoration: InputDecoration(
        fillColor: Get.theme.fadedWhite,
        labelText: labelText,
        labelStyle: Get.theme.kLinkTextStyle,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item,style: Get.theme.kLabelTextStyle,),
      ))
          .toList(),
      onChanged: (value) {},
    ),
  );
}