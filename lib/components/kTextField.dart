import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

Widget buildTextField({required String labelText, required String? Function(dynamic value) validator}) {
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
    child: TextFormField(
      style: TextStyle(
        color: Get.theme.colorLevel0),
      decoration: InputDecoration(
        fillColor: Get.theme.colorLevel4,
        labelText: labelText,
        labelStyle: TextStyle(color: Get.theme.colorLevel0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}