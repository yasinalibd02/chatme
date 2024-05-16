import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/data/categories_data.dart';
import '../../../backend/data/icons.dart';
import '../../../widget/dashbaord/categories_screen_widget.dart';
import 'products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:
          products.map((product) => product.category).toSet().toList().length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        String category =
            products.map((product) => product.category).toSet().toList()[index];
        String iconUrl = getCategoryIconUrl(category);
        return GestureDetector(
          onTap: () {
            Get.to(ProductsScreen(
                category: category,
                products: products
                    .where((product) => product.category == category)
                    .toList()));
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  iconUrl,
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 10),
                Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
