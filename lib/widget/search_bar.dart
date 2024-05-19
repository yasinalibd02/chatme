import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? borderColor;
  final int maxLines;

  const SearchInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.borderColor = AppColor.blackColor,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  // ignore: unused_field
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: AppColor.primaryColor,
        fontSize: Dimensions.headingTextSize4,
      ),
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:  const Icon(Icons.search ,size: 25,
        color: AppColor.blackColor,),
        hintText: widget.hintText,
          contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Ad
      
        hintStyle: const TextStyle(
          color:Colors.black,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(Dimensions.radius*1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.black),
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),

        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),

        ),
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
