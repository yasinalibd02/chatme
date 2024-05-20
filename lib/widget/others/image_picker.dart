import 'dart:io';
import 'package:chatme/constants/app_assets.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_sized.dart';



class ImagePickerWidget extends StatelessWidget {
  final VoidCallback? onImagePick;
  final bool isImagePathSet;
  final bool isPicker;
  final String? imagePath;
  final String imageUrl;

  const ImagePickerWidget({
    super.key,
    this.onImagePick,
    this.isImagePathSet = false,
    this.imagePath,
    this.imageUrl = '',
    this.isPicker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
              width: 3.38,
              color: Theme.of(context).primaryColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                width: 5,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              shape: BoxShape.circle,
            ),
            child: isImagePathSet
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: Dimensions.radius * 5.5,
                    backgroundImage: FileImage(
                      File(imagePath!),
                    ),
                  )
                : CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColorDark,
                      radius: Dimensions.radius * 5.5,
                     child: Icon(Icons.person,
                     color: AppColor.blackColor,
                      size: 80.r,
                     ),
                    )
          ),
        ),
        Positioned(
          bottom: 5,
          right: 118,
          child: InkWell(
            onTap: onImagePick,
            child: Visibility(
              visible: isPicker,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  foregroundColor:  AppColor.primaryColor,
                  radius: Dimensions.radius * 1.5,
                  backgroundColor:  AppColor.primaryColor,
               child:  Icon(Icons.camera_alt_rounded,
               color: AppColor.whiteColor,
               size: 20.r,
               ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

 