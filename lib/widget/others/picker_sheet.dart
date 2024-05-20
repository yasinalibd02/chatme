import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_sized.dart';

class ImagePickerSheet extends StatelessWidget {
  final VoidCallback fromCamera, fromGallery;
  const ImagePickerSheet({
    super.key,
    required this.fromCamera,
    required this.fromGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: fromGallery,
              child:  Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.image,
                            color: AppColor.primaryColor,
                          size: Dimensions.iconSizeLarge,
                        ),
                      ),
                      Text(
                    AppString.fromGallery.tr,
                       style: CustomStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            
            spaceHor(Dimensions.widthSize * 4),
            InkWell(
              onTap: fromCamera,
          
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColor.primaryColor,
                          size: Dimensions.iconSizeLarge,
                        ),
                      ),
                      Text(
                         AppString.fromCamera.tr,
                       style: CustomStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            
          ],
        ).paddingSymmetric(vertical: Dimensions.marginSizeVertical * 1.2),
      ],
    );
  }
}
