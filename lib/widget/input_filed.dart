import 'package:flutter/material.dart';

class CommonInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Color borderColor;
  final int maxLines;

  const CommonInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.borderColor,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
