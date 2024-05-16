import 'package:chatme/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../getx/navbar/profile_controller.dart';
import '../../widget/input_filed.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _logoWidget(context),
        _inputWidget(context),
        _commonButton(context),
      ],
    );
  }

  _logoWidget(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      color: AppColor.primaryColor,
      height: MediaQuery.sizeOf(context).height * 0.2,
    );
  }

  _inputWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.8),
      child: Column(
        children: [
          spaceVer(Dimensions.heightSize * 2),
          //!>>>> country
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterCountry,
            labelText: AppString.country,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
          //!>>>> mobile number
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterMobileNumber,
            labelText: AppString.mobileNumber,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterEmailAddress,
            labelText: AppString.emailAddress,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),

          spaceVer(Dimensions.heightSize),

          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterAddress,
            labelText: AppString.address,
            borderColor: AppColor.borderColor,
            maxLines: 2,
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
        horizontal: Dimensions.paddingSizeHorizontal*0.8
      ),
      child: CommonButton(
        title: AppString.update,
        onPressed: () {
          // Get.toNamed(Routes.navigationScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),   );
  }
}
