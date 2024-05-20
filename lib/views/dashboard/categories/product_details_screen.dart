import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/models/categores_model.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/routes.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/others/my_app_bar_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: MyAppBar(
        title: product.name,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical*0.3,
          horizontal: Dimensions.marginSizeHorizontal*0.78
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.imageUrl,
              width: 250,
              height: 150,
            ),
            spaceVer(Dimensions.heightSize*2),
            Text(
              product.details,
              style: CustomStyle.mediumTextStyle
            ),
                    spaceVer(Dimensions.heightSize * 2),

            Text(
              'Price: \$${product.price.toString()}',
          style: CustomStyle.smallestTextStyle
            ),
            Text(
               'Address: mirpur,dhaka,Bangladesh',
             
                style: CustomStyle.smallestTextStyle),
            spaceVer(Dimensions.heightSize*2.5),

            Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 2,
      ),
      child: CommonButton(
        title: AppString.order.tr,
        onPressed: () {
          Get.toNamed(Routes.navigationScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),
    ),
          ],
        ),
      ),
    );
  }
}
