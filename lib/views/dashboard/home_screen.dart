import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../widget/dashbaord/categories_widget.dart';
import '../../widget/dashbaord/popular_widget.dart';
import '../../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _searchBarWidget(context),
        _categoriesWidget(context),
        _productsWidget(context),
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
        hintText: AppString.searchHere,
      ),
    );
  }

  _categoriesWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///>>> title text
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal),
          child: Text(
            AppString.categorie,
            style: CustomStyle.mediumTextStyle,
          ),
        ),

        //! gridview
        SizedBox(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection:
                Axis.horizontal, // Set scroll direction to horizontal
            itemCount: 5,
            itemBuilder: (context, index) {
              return  const CategoryWidget(
                imageUrl: AppAssets.food,
                title: "Food",
              );
            },
          ),
        )
      ],
    );
  }

  _productsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///>>> title text
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal),
          child: Text(
            AppString.product,
            style: CustomStyle.mediumTextStyle,
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection:
                Axis.horizontal, // Set scroll direction to horizontal
            itemCount: 5,
            itemBuilder: (context, index) {
              return const CategoryWidget(
                imageUrl: AppAssets.food,
                title: "Food",
              );
            },
          ),
        )
      ],
    );
  }

  _popularWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///>>> title text
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal),
          child: Text(
            AppString.popular,
            style: CustomStyle.mediumTextStyle,
          ),
        ),
        SizedBox(
            height: Dimensions.heightSize), // You can use SizedBox for spacing

        SizedBox(
          height: 200,
          // Wrap the ListView.builder with Expanded
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ProductListTile(
                imageUrl: 'https://example.com/product.jpg',
                title: 'Product Name',
                price: 29.99,
              );
            },
          ),
        ),
      ],
    );

  }
}
