import 'package:chatme/constants/app_sized.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
class CustomStyle {
  static var smallTextStyle = TextStyle(
     fontFamily: 'Rubik',
    color: AppColor.secondaryTextColor,
    fontSize: Dimensions.headingTextSize5,
    fontWeight: FontWeight.w400,
  );
  static var smallestTextStyle = TextStyle(
     fontFamily: 'Rubik',
    color: AppColor.primaryTextColor,
    fontSize: Dimensions.headingTextSize4,
    fontWeight: FontWeight.w500,
  );

  static var mediumTextStyle = TextStyle(
    fontFamily: 'Rubik',
     color: AppColor.primaryTextColor,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w600,
  );

  static var largeTextStyle = TextStyle(
    fontFamily: 'Rubik',
     color: AppColor.primaryTextColor,
    fontSize: Dimensions.headingTextSize2,
    fontWeight: FontWeight.w700,
  );
   static var largestTextStyle = TextStyle(
    fontFamily: 'Rubik',
    color: AppColor.primaryTextColor,
    fontSize: Dimensions.headingTextSize1,
    fontWeight: FontWeight.w700,
  );
}
 
