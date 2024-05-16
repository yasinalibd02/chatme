import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: double.infinity,
          height: 10, // Adjust the height of the image as needed
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8), // Add some spacing between the image and the title
        Text(
          title,
          style: TextStyle(
            fontSize: 18, // Adjust the font size of the title as needed
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
