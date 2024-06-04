import 'dart:ui';

import 'package:chatme/constants/routes.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../getx/navbar/navigation_controller.dart';
import '../drawer/drawer_screen.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);

  final controller = Get.put(NavigationController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        key: _key,
        drawer: DrawerScreen(),
        appBar: _appBarWidget(context),
        bottomNavigationBar: buildBottomNavigationMenu(context),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => controller.page[controller.selectedIndex.value]);
  }

  buildBottomNavigationMenu(context) {
    return Container(
      height: Dimensions.heightSize * 5.2,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          ),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x19000000), // fixed color
            blurRadius: Dimensions.radius,
            offset: const Offset(0, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: BottomAppBar(
        elevation: 0,
        notchMargin: 7,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              bottomItemWidget(context, Icons.home, AppString.home.tr, 0),
              bottomItemWidget(
                  context, Icons.category, AppString.categories.tr, 1),
              bottomItemWidget(
                  context, Icons.notifications, AppString.notification.tr, 2),
              bottomItemWidget(context, Icons.person, AppString.profile.tr, 3),
            ],
          ),
        ),
      ),
    );
  }

  bottomItemWidget(context, var icon, label, page) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          controller.selectedIndex.value = page;
        },
        child: controller.selectedIndex.value == page
            ? Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3,
                width: Dimensions.widthSize * 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: _buildRow(context, icon, label, page),
              )
            : Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3,
                width: Dimensions.heightSize * 3.5,
                child: _buildRow(context, icon, label, page),
              ),
      ),
    );
  }

  _buildRow(context, var icon, label, page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: controller.selectedIndex.value == page
              ? AppColor.primaryColor
              : AppColor.primaryTextColor.withOpacity(0.4),
        ),
        spaceHor(Dimensions.widthSize * 0.5),
        Visibility(
          visible: controller.selectedIndex.value == page,
          child: Text(
            label,
            style: TextStyle(
              fontSize: Dimensions.headingTextSize6,
              color: controller.selectedIndex.value == page
                  ? AppColor.primaryColor
                  : AppColor.primaryTextColor.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  _appBarWidget(context) {
    return controller.selectedIndex.value == 0
        ? _homeAppBarWidget()
        : _marketplaceAppBarWidget(context);
  }

  _homeAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          _key.currentState!.openDrawer(); // <-- Opens drawer
        },
        child: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSizeHorizontal,
              right: Dimensions.marginSizeHorizontal * 0.2,
            ),
            child: Icon(
              Icons.menu,
              size: 25.h,
              color: AppColor.blackColor,
            )),
      ),
      title: Image.asset(
        AppAssets.logo,
        color: AppColor.primaryColor,
        height: 80,
        width: 100,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.cartScreen);
          },
          child: Padding(
              padding: EdgeInsets.only(
                right: Dimensions.marginSizeHorizontal * 0.7,
                left: Dimensions.marginSizeHorizontal * 0.7,
              ),
              child: Icon(
                Icons.shopping_basket,
                size: 25.h,
                color: AppColor.blackColor,
              )),
        ),
      ],
    );
  }

  _marketplaceAppBarWidget(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        _titleWidget(controller.selectedIndex.value),
        style: CustomStyle.largeTextStyle,
      ),
      centerTitle: true,
      actions: [
        _filterProcessWidget(context),
      ],
    );
  }

  _titleWidget(index) {
    switch (index) {
      case 1:
        return AppString.categories.tr;
      case 2:
        return AppString.notification.tr;
      case 3:
        return AppString.profile.tr;
    }
  }

  _filterProcessWidget(BuildContext context) {
    return Visibility(
      visible: controller.selectedIndex.value == 1,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          _showFilterDialog(context);
        },
        child: Container(
          margin: EdgeInsets.only(right: Dimensions.marginSizeHorizontal),
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSize * 0.3,
            horizontal: Dimensions.paddingSize * 0.25,
          ),
          decoration: ShapeDecoration(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            ),
          ),
          child: const Icon(Icons.menu),
        ),
      ),
    );
  }

  _showFilterDialog(BuildContext context) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 2.5,
            vertical: Dimensions.marginSizeVertical * 0.6,
          ),
          alignment: Alignment.topRight,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.back();
                            Get.close(1);
                          },
                          child: const Icon(Icons.back_hand),
                        ),
                        spaceHor(Dimensions.widthSize),
                        Text(
                          AppString.filters.tr,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // marketplaceController.onResetFilterValue();
                      },
                      child: Text(
                        AppString.reset.tr,
                        style: CustomStyle.smallestTextStyle,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Get.isDarkMode
                      ? AppColor.whiteColor.withOpacity(0.10)
                      : AppColor.blackColor.withOpacity(0.10),
                ),
                // CurrencyDropDown(isDialogField: true),
                spaceVer(Dimensions.heightSize * 0.5),
                // const Text(
                //   text: AppString.selectAmount,
                //   fontWeight: FontWeight.w500,
                //   opacity: 0.30,
                // ),
                // Obx(
                //   () => SizedBox(
                //     height: Dimensions.heightSize * 1.7,
                //     child: SliderTheme(
                //       data: SliderThemeData(
                //         thumbShape: RoundSliderThumbShape(
                //             enabledThumbRadius: Dimensions.radius * 0.8),
                //         trackShape: CustomTrackShape(),
                //       ),
                //       child: Slider(
                //         value: marketplaceController.amount.value,
                //         onChanged: (newValue) {
                //           marketplaceController.amount.value = newValue;
                //         },
                //         min: 0,
                //         max: 100,
                //         thumbColor: Theme.of(context).primaryColor,
                //         activeColor: Theme.of(context).primaryColor,
                //         inactiveColor:
                //             Theme.of(context).scaffoldBackgroundColor,
                //       ),
                //     ),
                //   ),
                // ),

                // Obx(
                //   () => Text(
                //     text: marketplaceController.amount.value.toStringAsFixed(2),
                //     fontSize: Dimensions.headingTextSize6,
                //     opacity: 0.30,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // verticalSpace(Dimensions.heightSize),
                // const TitleHeading4Widget(
                //   text: AppString.selectRate,
                //   fontWeight: FontWeight.w500,
                //   opacity: 0.30,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx + 5;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
