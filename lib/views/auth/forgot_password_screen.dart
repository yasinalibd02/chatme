import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/constants/routes.dart';
import 'package:chatme/constants/style.dart';
import 'package:chatme/getx/auth/forgot_password_controller.dart';
import 'package:chatme/widget/custom_button.dart';
import 'package:chatme/widget/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../widget/others/my_app_bar_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: AppString.forgotPassword,
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

        Text(
          AppString.pleaseProvideTheEmailAddress,
          style: CustomStyle.mediumTextStyle,
        ),
        spaceVer(Dimensions.heightSize * 1.4),

        //>>>>>>>>>> common input filed
        CommonInputField(
          controller: controller.emailController,
          hintText: AppString.enterEmailAddress,
          labelText: AppString.emailAddress,
        ),
        spaceVer(Dimensions.heightSize * 4),
        CommonButton(
          title: AppString.submit,
          onPressed: () {
            Get.toNamed(Routes.forgotOtpScreen);
          },
          borderColor: AppColor.primaryColor,
          buttonColor: AppColor.primaryColor,
        )
      ],
    );
  }
}
