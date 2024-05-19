import 'package:chatme/constants/routes.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/widget/custom_button.dart';
import 'package:chatme/widget/input_filed.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../getx/auth/reset_password_controller.dart';
import '../../widget/others/my_app_bar_widget.dart';
class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});
  final controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: AppString.resetPassword,
      ),
      body: _allBody(context),
    );
  }

  _allBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(Dimensions.paddingSize),
      children: [
        //>>> title
        spaceVer(Dimensions.heightSize * 3),

         Text(AppString.resetYourPassword,
        style: CustomStyle.mediumTextStyle.copyWith(
          fontSize: Dimensions.headingTextSize2,
          fontWeight: FontWeight.w500

        ),
        ),
        spaceVer(Dimensions.heightSize*1.5),

        //>>>>>>>>>> common input filed
        CommonInputField(
              isPassword: true,
            controller: controller.newPasswordController,
            hintText: AppString.enterNewPassword,
            labelText: AppString.newPassword),
            spaceVer(Dimensions.heightSize),
              CommonInputField(
                    isPassword: true,
            controller: controller.confirmPasswordController,
            hintText: AppString.enterConfirmPassword,
            labelText: AppString.confirmPassword),
        spaceVer(Dimensions.heightSize * 4),

        //>>>>>>. common button
        CommonButton(
          title: AppString.reset,
          onPressed: () {
         Get.toNamed(Routes.signInScreen);
          },
          borderColor: AppColor.primaryColor,
          buttonColor: AppColor.primaryColor,
        )
      ],
    );
  }
}
