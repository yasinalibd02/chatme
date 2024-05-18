import 'package:chatme/constants/app_sized.dart';
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
      padding: EdgeInsets.all(
        Dimensions.paddingSize*0.8
      ),
      itemCount:
          products.map((product) => product.category).toSet().toList().length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
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
                Image.asset(
                  iconUrl,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  category,
                  style: const TextStyle(
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
