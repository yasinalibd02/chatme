import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/models/categores_model.dart';
import '../../../widget/others/counter_widget.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String category;
  final List<Product> products;

  ProductsScreen({required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(products[index].imageUrl),
            ),
            title: Text(products[index].name),
            subtitle: Text('Price: \$${products[index].price.toString()}'),
            trailing: ProductCounter(),
            onTap: () {
              Get.to(ProductDetailsScreen(product: products[index]));
            },
          );
        },
      ),
    );
  }
}
