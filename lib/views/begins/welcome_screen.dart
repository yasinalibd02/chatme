
import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constants/app_sized.dart';
import '../../constants/routes.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.22,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppAssets.welcome,
                    ),
                    fit: BoxFit.cover,
                    ),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                     ),
          SizedBox(
           height:  Dimensions.heightSize),

           const Text( AppString.appName ),
          SizedBox(height:  Dimensions.heightSize),
          const Text(
               "Welcome to Our World of Shopping Delights"),
          const Spacer(),
          const Divider(),
          CommonButton(
            title: "Get Started",
            onPressed: () {
              Get.toNamed(Routes.signInScreen);
            },
            borderColor: AppColor.backgroundColor,
            buttonColor: AppColor.searchBgColor,
          ),
          
        ],
      ),
    );
  }
}
