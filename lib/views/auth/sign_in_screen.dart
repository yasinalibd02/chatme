
import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_sized.dart';
import '../../getx/auth/sign_in_controller.dart';
import '../../widget/custom_button.dart';
import '../../widget/input_filed.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(SignInController());

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
        Image.asset(AppAssets.logo),
         CommonInputField(
            controller: TextEditingController(),
            hintText: "Enter your text here",
            labelText: "Label Text",
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),

          CommonButton(
            title: "Log In",
            onPressed: () {

            },
            borderColor: AppColor.backgroundColor,
            buttonColor: AppColor.backgroundColor,
          ),

          SizedBox( 
            height: 
            Dimensions.heightSize),
        ],
      ),
    );
  }
}
