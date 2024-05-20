import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/style.dart';
import 'package:chatme/backend/data/categories_data.dart'; // Assuming this contains the products data
import 'package:chatme/constants/app_sized.dart'; // Assuming this contains Dimensions
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/widget/others/counter_widget.dart';
import '../../backend/data/icons.dart';
import '../../widget/search_bar.dart';
import 'categories/product_details_screen.dart';
import 'categories/products_screen.dart'; // Adjust the import path accordingly

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _searchBarWidget(context),
        _categoriesWidget(context),
        _productWidget(context),
        _popularWidget(context),
      ],
    );
  }

  _searchBarWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal,
          vertical: Dimensions.paddingSizeVertical * 0.7),
      child: SearchInputField(
        controller: TextEditingController(),
        hintText: AppString.searchHere.tr,
      ),
    );
  }

  _categoriesWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title text
        spaceVer(Dimensions.heightSize * 0.8),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal),
          child: Text(
            AppString.categorie.tr,
            style: CustomStyle.mediumTextStyle
                .copyWith(fontSize: Dimensions.headingTextSize3 + 2),
          ),
        ),
        // Constrained ListView.builder
        SizedBox(
          height: 100.h, // Set this to the desired height for the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.8,
                vertical: Dimensions.paddingSizeVertical * 0.28),
            itemCount: products
                .map((product) => product.category)
                .toSet()
                .toList()
                .length,
            itemBuilder: (context, index) {
              String category = products
                  .map((product) => product.category)
                  .toSet()
                  .toList()[index];
              String iconUrl = getCategoryIconUrl(category);
              return GestureDetector(
                onTap: () {
                  Get.to(ProductsScreen(
                    category: category,
                    products: products
                        .where((product) => product.category == category)
                        .toList(),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: Dimensions.marginSizeHorizontal * 0.2),
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
                        height: 35.h,
                        width: 70.w,
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.9),
                      Text(category,
                          style: CustomStyle.mediumTextStyle
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _productWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceVer(Dimensions.heightSize * 1.8),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal),
          child: Text(
            AppString.products.tr,
            style: CustomStyle.mediumTextStyle
                .copyWith(fontSize: Dimensions.headingTextSize3 + 2),
          ),
        ),
        SizedBox(
          height: 190.h,
         
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.2,
                vertical: Dimensions.paddingSize * 0.4),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ProductDetailsScreen(product: products[index]));
                },
                child: Container(
                  width: 175.w, // Adjust the width based on your design
                  margin: EdgeInsets.only(
                    bottom: Dimensions.paddingSize * 0.2,
                    left: Dimensions.paddingSize * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        products[index].imageUrl,
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
                                    products[index].name,
                                    style: CustomStyle.mediumTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    'Price: \$${products[index].price.toString()}',
                                    style: CustomStyle.smallestTextStyle
                                        .copyWith(
                                            fontSize:
                                                Dimensions.headingTextSize5,
                                            color: AppColor.categoryShadow),
                                  ),
                                ),
                              ],
                            ),
                            spaceVer(Dimensions.heightSize * 0.4),
                            const ProductCounter()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _popularWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      spaceVer(Dimensions.heightSize * 1.8),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeHorizontal),
        child: Text(
          AppString.popular.tr,
          style: CustomStyle.mediumTextStyle
              .copyWith(fontSize: Dimensions.headingTextSize3 + 2),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height *
            150.h, // Set the height to a value that fits your design
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * 0.2,
            vertical: Dimensions.paddingSize * 0.4,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.to(ProductDetailsScreen(product: products[index]));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Dimensions.paddingSize * 0.2,
                    left: Dimensions.paddingSize * 0.5,
                    right: Dimensions.paddingSize * 0.5,
                  ),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.8)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColor.primaryColor.withOpacity(0.3),
                      backgroundImage: AssetImage(
                        products[index].imageUrl,
                      ),
                      foregroundColor: AppColor.primaryColor.withOpacity(0.3),
                    ),
                    title: Text(
                      products[index].name,
                      style: CustomStyle.mediumTextStyle,
                    ),
                    subtitle: Text(
                      'Price: \$${products[index].price.toString()}',
                      style: CustomStyle.smallestTextStyle
                          .copyWith(color: AppColor.categoryShadow),
                    ),
                    trailing: const ProductCounter(),
                    onTap: () {
                      Get.to(ProductDetailsScreen(product: products[index]));
                    },
                  ),
                ),);
          },
        ),
      )
    ]);
  }
}
