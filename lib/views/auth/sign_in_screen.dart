import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sized.dart';
import '../../constants/routes.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logoWidget(context),
          _titleSubtitleWidget(context),
          _commonInputField(context),
          _buttonWidget(context),
          _doNotHaveAnAccount(context)
        ],
      ),
    );
  }

  _logoWidget(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      color: AppColor.primaryColor,
      height: MediaQuery.sizeOf(context).height * 0.2,
    );
  }

  _titleSubtitleWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spaceVer(Dimensions.heightSize),
        Text(
          textAlign: TextAlign.center,
          AppString.signInWelcome.tr,
          style: CustomStyle.largestTextStyle,
        ),
        Text(AppString.welcomeSubTitle, style: CustomStyle.smallestTextStyle),
      ],
    );
  }

  _commonInputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        spaceVer(Dimensions.heightSize * 3),
        CommonInputField(
          controller: TextEditingController(),
          hintText: AppString.enterEmailAddress.tr,
          labelText: AppString.emailAddress.tr,
          borderColor: AppColor.borderColor,
          maxLines: 1,
        ),
        spaceVer(Dimensions.heightSize),
        CommonInputField(
          controller: TextEditingController(),
          hintText: AppString.enterPassword.tr,
          labelText: AppString.password.tr,
          borderColor: AppColor.borderColor,
          maxLines: 1,
        ),
        spaceVer(Dimensions.heightSize * 0.5),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.forgotPasswordScreen);
          },
          child: SizedBox(
            height: Dimensions.heightSize * 1.5,
            child: Text(
              AppString.forgotPasswordQ.tr,
              style: CustomStyle.smallTextStyle
                  .copyWith(color: AppColor.primaryColor),
            ),
          ),
        ),
        spaceVer(Dimensions.heightSize),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 2,
      ),
      child: CommonButton(
        title: AppString.signIn.tr,
        onPressed: () {
          Get.toNamed(Routes.navigationScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),
    );
  }

  _doNotHaveAnAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppString.doNotHaveAnAccount.tr,
        style: CustomStyle.smallTextStyle,
        children: [
          TextSpan(
            text: AppString.signUp.tr,
            style: CustomStyle.smallTextStyle.copyWith(
              color: AppColor.primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(Routes.signUpScreen);
              },
          )
        ],
      ),
    );
  }
}
