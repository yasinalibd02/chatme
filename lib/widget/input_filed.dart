import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:flutter/material.dart';

class CommonInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Color? borderColor;
  final int maxLines;
  final bool isPassword;

  const CommonInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.borderColor = AppColor.primaryColor,
    this.maxLines = 1,
    this.isPassword = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommonInputFieldState createState() => _CommonInputFieldState();
}

class _CommonInputFieldState extends State<CommonInputField> {
  bool _isFocused = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: AppColor.primaryColor,
        fontSize: Dimensions.headingTextSize4,
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle:
            TextStyle(color: _isFocused ? AppColor.primaryColor : Colors.black),
        hintStyle:
            TextStyle(color: _isFocused ? AppColor.primaryColor : Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: _isFocused ? AppColor.primaryColor : Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      maxLines: widget.maxLines,
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onEditingComplete: () {
        setState(() {
          _isFocused = false;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
