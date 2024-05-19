import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../backend/data/categories_data.dart';
import '../../../backend/data/icons.dart';
import '../../../constants/style.dart';
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
          child:  Container(
            margin:
                EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.2),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal * 0.5,
              vertical: Dimensions.paddingSizeVertical * 0.25,
            ),
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(Dimensions.radius)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconUrl,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 10),
               Text(category,
                    style: CustomStyle.mediumTextStyle
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        );
      },
    );
  }
}
