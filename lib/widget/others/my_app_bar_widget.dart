import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      leading: Padding(
        padding:EdgeInsets.only(
          left: Dimensions.paddingSizeHorizontal*0.5,
          right: Dimensions.paddingSizeHorizontal*0.5,
        ),
        child: CircleAvatar(
        backgroundColor: 
            AppColor.primaryColor,
        
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
              size: 18.r,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: CustomStyle.largeTextStyle.copyWith(
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
