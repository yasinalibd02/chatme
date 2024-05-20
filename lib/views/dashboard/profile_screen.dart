import 'package:chatme/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../getx/navbar/profile_controller.dart';
import '../../widget/input_filed.dart';
import '../../widget/others/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/others/picker_sheet.dart';

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
    return Obx(
      () => ImagePickerWidget(
        isImagePathSet: controller.isImagePathSet.value,
        imagePath: controller.userImagePath.value,
        imageUrl: "",
        onImagePick: () {
          _showImagePickerBottomSheet(context);
        },
      ),
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
            hintText: AppString.enterCountry.tr,
            labelText: AppString.country.tr,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
          //!>>>> mobile number
          CommonInputField(
            controller: TextEditingController(),
            hintText: AppString.enterMobileNumber.tr,
            labelText: AppString.mobileNumber.tr,
            borderColor: AppColor.borderColor,
            maxLines: 1,
          ),
          spaceVer(Dimensions.heightSize),
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
            hintText: AppString.enterAddress.tr,
            labelText: AppString.address.tr,
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
          horizontal: Dimensions.paddingSizeHorizontal * 0.8),
      child: CommonButton(
        title: AppString.update.tr,
        onPressed: () {
          // Get.toNamed(Routes.navigationScreen);
        },
        borderColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
      ),
    );
  }

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: ImagePickerSheet(
            fromCamera: () {
              Get.back();
              controller.chooseImageFromCamera();
            },
            fromGallery: () {
              Get.back();
              controller.chooseImageFromGallery();
            },
          ),
        );
      },
    );
  }
}
