import 'package:chatme/constants/routes.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../getx/navbar/navigation_controller.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      backgroundColor: AppColor.whiteColor,
      child: ListView(
        children: [
          _backButton(context),
          _userInfoWidget(context),
          _drawerTitle(context),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.5),
    );
  }

  _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          // Get.back();
          Get.close(1);
        },
        child: Icon(
          Icons.arrow_back,
          color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
        ),
      ).paddingOnly(
        top: Dimensions.heightSize * 0.5,
      ),
    );
  }

  _userInfoWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          color: AppColor.primaryColor,
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeHorizontal * 0.2),
          child: Divider(
            color: AppColor.whiteColor.withOpacity(0.6),
            height: 1,
          ),
        ),
        Text(
          "Emily Johson",
          style: CustomStyle.mediumTextStyle,
        ).paddingOnly(
          top: Dimensions.paddingSize * 0.4,
        ),
        Text(
          "emilyjohson@gmail.com",
          style: CustomStyle.smallTextStyle,
        ).paddingOnly(
          bottom: Dimensions.paddingSize,
        ),
      ],
    );
  }

  _drawerTitle(BuildContext context) {
    return Column(
      children: [
        buildMenuItem(
          context,
          title: AppString.changePassword.tr,
          imagePath: Icons.key_outlined,
          onTap: () {
            Get.toNamed(Routes.changePasswordScreen);
          },
        ),
        buildMenuItem(
          context,
          title: AppString.changeLanguage.tr,
          imagePath: Icons.language,
          onTap: () {
            Get.toNamed(Routes.changeLanguageScreen);
          },
        ),
         buildMenuItem(
          context,
          title: AppString.history.tr,
          imagePath: Icons.history,
          onTap: () {
            Get.toNamed(Routes.historyScreen);
          },
        ),
        buildMenuItem(
          context,
          title: AppString.aboutUs.tr,
          imagePath: Icons.contact_page_rounded,
          onTap: () {},
        ),
        buildMenuItem(
          context,
          title: AppString.privacyPolicy.tr,
          imagePath: Icons.privacy_tip_outlined,
          onTap: () {},
        ),
        buildMenuItem(
          context,
          title: AppString.signOut.tr,
          imagePath: Icons.logout_outlined,
          onTap: () {
            Get.offAllNamed(Routes.signInScreen);
          },
        ),
      ],
    );
  }

  buildMenuItem(
    context, {
    required String title,
    required IconData imagePath,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * 0.7,
            vertical: Dimensions.paddingSize * 0.12,
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      imagePath,
                      color: AppColor.primaryColor,
                      size: Dimensions.radius * 2.2,
                    ),
                  ),
                ),
                spaceHor(Dimensions.widthSize),
                Text(
                  title,
                  style: CustomStyle.mediumTextStyle.copyWith(
                    fontSize: Dimensions.headingTextSize2-1,
                  ),
                ).paddingOnly(
                  top: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

