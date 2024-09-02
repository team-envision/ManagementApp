import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DatePickerField extends StatelessWidget {
  final String hintText;
  final Rx<DateTime> selectedDate;
  final Function(DateTime) onDateChanged;

  DatePickerField({
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
          hintStyle: TextStyle(color: Colors.black12),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
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

          style: TextStyle(color: Colors.grey[700]),),
    );
  }
}