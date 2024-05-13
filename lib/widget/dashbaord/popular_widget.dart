import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const ProductListTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 50, // Adjust the width of the image as needed
        height: 50, // Adjust the height of the image as needed
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Text('\$$price'),
    );
  }
}
