import 'dart:ui';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: AppColor.colorGrey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(""),
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: ListView(
          children: [
            _appLogoWidget(context),
            _userInfoWidget(context),
            _drawerTitle(context),
          ],
        ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.5),
      ),
    );
  }

  _userInfoWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          "Emily Johson",
          style: CustomStyle.mediumTextStyle,
        ).paddingOnly(
          top: Dimensions.paddingSize * 0.5,
          bottom: Dimensions.paddingSize * 0.1,
        ),
        Text(
          "emilyjohson@gmail.com",
          style: CustomStyle.smallTextStyle,
        )
      ],
    );
  }

  _appLogoWidget(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // Get.back();
            Get.close(1);
          },
          child: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
          ),
        ),
        spaceHor(Dimensions.widthSize * 3),
        // const AppBasicLogo(scale: 22),
      ],
    ).paddingOnly(
      bottom: Dimensions.paddingSize * 2.3,
      top: Dimensions.heightSize * 0.5,
    );
  }

  _drawerTitle(BuildContext context) {
    return Column(
      children: [
        buildMenuItem(
          context,
          title: AppString.categories,
          imagePath: Icons.history,
          onTap: () {
            // controller.onTransaction;
          },
        ),
        buildMenuItem(
          context,
          title: AppString.changeLanguage,
          imagePath: Icons.password,
          onTap: () {
            // controller.onIdentityVerification;
          },
        ),
        buildMenuItem(
          context,
          title: AppString.changePassword,
          imagePath:Icons.language,
          onTap: () {
            // controller.onTwoFaVerification;
          },
        ),
        buildMenuItem(
          context,
          title: AppString.aboutUs,
          imagePath: Icons.abc_outlined,
          onTap: () {
            // controller.onChangePassword;
          },
        ),
        buildMenuItem(
          context,
          title: AppString.privacyPolicy,
          imagePath: Icons.r_mobiledata,
          onTap: () {
            // controller.onHelpCenter;
          },
        ),
       
      
        buildMenuItem(
          context,
          title: AppString.signOut,
          imagePath: Icons.logout_outlined,
          onTap: () {
            // signOutDialog(context, controller);
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
    double scaleImage = 1,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize,
            vertical: Dimensions.paddingSize * 0.1,
          ),
          child: ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(imagePath),
              ),
            ),
            title: Text(
              title,
              style: CustomStyle.mediumTextStyle,
            ),
            onTap: onTap,
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
