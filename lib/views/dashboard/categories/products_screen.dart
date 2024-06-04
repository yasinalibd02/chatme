import 'package:chatme/backend/data/categories_data.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:chatme/widget/others/my_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/models/categores_model.dart';
import '../../../widget/others/counter_widget.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String category;
  final List<Product> products;

  const ProductsScreen({super.key, required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: category,
      ),
      body: ListView.builder(
 
        padding: EdgeInsets.symmetric(
horizontal: Dimensions.paddingSize*0.2,
vertical: Dimensions.paddingSize*0.4
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 
              Dimensions.paddingSize*0.2,
                 left: Dimensions.paddingSize * 0.5,
                      right: Dimensions.paddingSize * 0.5,  
              ),
          decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(
                0.2
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius*0.8)
          ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primaryColor.withOpacity(0.3),
                backgroundImage: AssetImage(products[index].imageUrl,
                
                ),
                foregroundColor: AppColor.primaryColor.withOpacity(0.3),
              ),
              title: Text(products[index].name,
              style: CustomStyle.mediumTextStyle,
              
              ),
              subtitle: Text('Price: \$${products[index].price.toString()}',
              style: CustomStyle.smallestTextStyle.copyWith(
                color: AppColor.categoryShadow
              ),
              ),
              trailing:  ProductCounter(products: products[index]),
              onTap: () {
                Get.to(ProductDetailsScreen(product: products[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
