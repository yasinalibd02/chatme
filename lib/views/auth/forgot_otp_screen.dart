import 'package:chatme/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/getx/auth/forgot_password_controller.dart';
import 'package:chatme/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/style.dart';
import '../../widget/others/my_app_bar_widget.dart';
import 'package:otp_text_field/style.dart';
class ForgotOtpScreen extends StatelessWidget {
   ForgotOtpScreen({super.key});
  final controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: AppString.otpScreen,
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
          AppString.pleaseEnterTheOpt,
          style: CustomStyle.mediumTextStyle,
        ),
        spaceVer(Dimensions.heightSize),

        //>>>>>>>>>> common input filed
    OTPTextField(
          length: 6,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 46,
          style:CustomStyle.mediumTextStyle.copyWith(
            color: AppColor.primaryColor,
          ),
          otpFieldStyle: OtpFieldStyle(
            enabledBorderColor:AppColor.blackColor,
            focusBorderColor: AppColor.primaryColor,
            disabledBorderColor: AppColor.blackColor,
          ),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,

          onChanged: (pin) {
            // Handle changed OTP
          },
          onCompleted: (pin) {
            // Handle completed OTP
          },
        ),
      
        spaceVer(Dimensions.heightSize * 4),
        CommonButton(
          title: AppString.submit,
          onPressed: () {
          Get.toNamed(Routes.resetPasswordScreen);
          },
          borderColor: AppColor.primaryColor,
          buttonColor: AppColor.primaryColor,
        )
      ],
    );
  }
}
