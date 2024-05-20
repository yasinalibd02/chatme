import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sized.dart';
import '../../constants/routes.dart';
import '../../getx/auth/sign_up_controller.dart';
import '../../widget/custom_button.dart';
import '../../widget/input_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.7),
      child: ListView(
       
        children: [
          _logoWidget(context),
          _titleSubtitleWidget(context),
          _commonInputField(context),
          _buttonWidget(context),
          _alreadyHaveAnAccount(context),
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
      children: [
        spaceVer(Dimensions.heightSize),
        Text(
          AppString.signUpTitle.tr,
          style: CustomStyle.largestTextStyle,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(AppString.signUpSubtitle.tr, style: CustomStyle.smallestTextStyle)),
      ],
    );
  }

  _commonInputField(BuildContext context) {
    return Column(
      children: [
        spaceVer(Dimensions.heightSize * 3),

        Row(children: [
          Expanded(
            child: CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterFirstName.tr,
            labelText: AppString.firstName.tr,
            borderColor: AppColor.borderColor,
            maxLines: 1,
                    ),
          ),
          spaceHor(Dimensions.widthSize*0.6),
            Expanded(
            child: CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterLastName.tr,
            labelText: AppString.lastName.tr,
            borderColor: AppColor.borderColor,
            maxLines: 1,
                    ),
          ),
        ],),
        spaceVer(Dimensions.heightSize * 1),
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
          isPassword: true,
          hintText: AppString.enterPassword.tr,
          labelText: AppString.password.tr,
          borderColor: AppColor.borderColor,
          maxLines: 1,
        ),
        spaceVer(Dimensions.heightSize),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 1.5,
      ),
      child: CommonButton(
        title: AppString.signUp.tr,
        onPressed: () {
          Get.toNamed(Routes.registrationOtpScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),
    );
  }

  _alreadyHaveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: AppString.alreadyHaveAn.tr,
          style: CustomStyle.smallTextStyle,
          children: [
            TextSpan(
              text: AppString.signIn.tr,
              style: CustomStyle.smallTextStyle.copyWith(
                color: AppColor.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.signInScreen);
                },
            )
          ],
        ),
      ),
    );
  }
  
}
