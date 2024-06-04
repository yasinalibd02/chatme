import 'package:chatme/backend/data/categories_data.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widget/others/my_app_bar_widget.dart';
import '../../getx/navbar/add_to_card_controller.dart';
import '../../widget/others/counter_widget.dart';
import 'categories/product_details_screen.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key,});
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(
        title: AppString.addToCart.tr,
      ),
       body: Obx(() {
        return GridView.builder(

           padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final product = cartController.cartItems[index];
               return GestureDetector(
              onTap: () {
                Get.to(ProductDetailsScreen(product: product));
              },
              child: Container(
                width: 175.w, // Adjust the width based on your design
                margin: EdgeInsets.only(
                  bottom: Dimensions.paddingSize * 0.2,
                  left: Dimensions.paddingSize * 0.7,
                ),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product.imageUrl,
                      height: 105.h,
                      width: 175.w,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeHorizontal * 0.3,
                          vertical: Dimensions.paddingSizeVertical * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  product.name,
                                  style: CustomStyle.mediumTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Price: \$${product.price.toString()}',
                                  style: CustomStyle.smallestTextStyle.copyWith(
                                      fontSize: Dimensions.headingTextSize5,
                                      color: AppColor.categoryShadow),
                                ),
                              ),
                            ],
                          ),
                          spaceVer(Dimensions.heightSize * 0.4),
                          ProductCounter(products: product)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
