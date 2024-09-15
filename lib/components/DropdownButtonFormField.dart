import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String labelText;
  final List<String> items;

  const CustomDropdownButton({Key? key, required this.labelText, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }
}