import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

Widget buildDropdownButtonFormField({required String labelText, required List<String> items, required String? Function(dynamic value) validator,}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          color: Get.theme.colorLevel0,
          spreadRadius: 2,
        )
      ],
    ),
    child: DropdownButtonFormField<String>(
      iconEnabledColor: Get.theme.colorLevel0,
      iconDisabledColor: Get.theme.colorLevel0,
      dropdownColor: Get.theme.colorLevel4,
      decoration: InputDecoration(
        fillColor: Get.theme.colorLevel4,
        labelText: labelText,
        labelStyle: TextStyle(color: Get.theme.colorLevel0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item,style: TextStyle(color: Get.theme.colorLevel0),),
      ))
          .toList(),
      onChanged: (value) {},
    ),
  );
}