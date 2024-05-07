import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color buttonColor;
  final double? width;

  const CommonButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.borderColor,
    required this.buttonColor,
     this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide( color: borderColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              ),
          ),
        ),
      ),
    );
  }
}
