import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../constants/routes.dart';
import '../../widget/custom_button.dart';
import '../../widget/input_filed.dart';
import '../../widget/others/my_app_bar_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: AppString.changePassword,),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _input(context),
        _commonButton(context),
      ],
    );
  }


  _input(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.8),
      child: Column(
        children: [
          spaceVer(Dimensions.heightSize * 2),
          //!>>>> old Password
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterOldPassword,
            labelText: AppString.oldPassword,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
          //!>>>> new password 
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterNewPassword,
            labelText: AppString.newPassword,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterConfirmPassword,
            labelText: AppString.confirmPassword,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),

  

          spaceVer(Dimensions.heightSize),
        ],
      ),
    );
  }

  _commonButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical,
          horizontal: Dimensions.paddingSizeHorizontal * 0.8),
      child: CommonButton(
        title: AppString.updatePassword,
        onPressed: () {
          Get.toNamed(Routes.navigationScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),
    );
  }
}

