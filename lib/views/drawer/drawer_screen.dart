import 'dart:ui';
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
            vertical: Dimensions.paddingSize * 0.1,
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
                      size: Dimensions.radius * 1.8,
                    ),
                  ),
                ),
                spaceHor(Dimensions.widthSize),
                Text(
                  title,
                  style: CustomStyle.mediumTextStyle.copyWith(
                    fontSize: Dimensions.headingTextSize3,
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

// signOutDialog(BuildContext context, NavigationController controller) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 5,
//           sigmaY: 5,
//         ),
//         child: Dialog(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(Dimensions.radius),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(Dimensions.paddingSize),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                    AppString.,
//                   textAlign: TextAlign.start,
//                 ),
//                 verticalSpace(Dimensions.heightSize),
//                 const TitleHeading4Widget(
//                   text: AppString.areYouSure,
//                   textAlign: TextAlign.start,
//                   opacity: 0.80,
//                 ),
//                 verticalSpace(Dimensions.heightSize),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: CustomContainer(
//                           height: Dimensions.buttonHeight * 0.7,
//                           borderRadius: Dimensions.radius * 0.8,
//                           color: Get.isDarkMode
//                               ? AppColor.primaryBGLightColor.withOpacity(0.15)
//                               : AppColor.primaryBGDarkColor.withOpacity(0.15),
//                           child: const TitleHeading4Widget(
//                             text: AppString.cancel,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     spaceHor(Dimensions.widthSize),
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           controller.signOutProcess();
//                         },
//                         child: Obx(
//                           () => controller.isLoading
//                               ? const CustomLoadingAPI()
//                               : CustomContainer(
//                                   height: Dimensions.buttonHeight * 0.7,
//                                   borderRadius: Dimensions.radius * 0.8,
//                                   color: Theme.of(context).primaryColor,
//                                   child: const TitleHeading4Widget(
//                                     text: AppString.okay,
//                                     color: AppColor.whiteColor,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ).paddingAll(Dimensions.paddingSize * 0.5),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
