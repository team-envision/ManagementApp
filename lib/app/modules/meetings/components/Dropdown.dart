import 'package:flutter/material.dart';
import 'package:get/get.dart';



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
              hintStyle: TextStyle(color: Colors.grey[700]),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.grey[700])),
              );
            }).toList(),
            onChanged: (value) => selectedValue.value = value!,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black, size: 24),
          ),
        ),
      ),
    );
  }
}