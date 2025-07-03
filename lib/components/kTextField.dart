import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

Widget buildTextField({required String labelText, required String? Function(dynamic value) validator}) {
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
    child: TextFormField(
      style: TextStyle(
        color: Get.theme.deepBlack),
      decoration: InputDecoration(
        fillColor: Get.theme.fadedWhite,
        labelText: labelText,
        labelStyle: TextStyle(color: Get.theme.deepBlack),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}