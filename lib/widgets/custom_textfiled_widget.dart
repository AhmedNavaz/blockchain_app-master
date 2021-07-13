import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    this.number,
    this.date,
    this.controller,
  }) : super(key: key);

  final String label;
  final String placeholder;
  final bool? number;
  final bool? date;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      keyboardType: number == true
          ? TextInputType.number
          : date == true
              ? TextInputType.datetime
              : TextInputType.name,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade600,
          fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
        ),
        contentPadding: EdgeInsets.all(5),
      ),
    );
  }
}
