import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeVertical*0.15,
        horizontal: Dimensions.paddingSizeHorizontal*0.15,
      ),
      margin: EdgeInsets.only(
        bottom: Dimensions.marginSizeVertical*0.1,
        left: Dimensions.marginSizeHorizontal*0.6,
        right: Dimensions.marginSizeHorizontal*0.6,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor.withOpacity(
          0.9
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.radius,
        )
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppColor.primaryColor,
          child: Icon(Icons.notifications,color: AppColor.whiteColor,),
        ),
        title: Text(title,
        style: CustomStyle.mediumTextStyle,
        ),
        subtitle: Text(message,
           style: CustomStyle.smallTextStyle,
        ),
        trailing: Text(time,
        style: CustomStyle.smallTextStyle.copyWith(
          color: AppColor.primaryColor
        ),
        
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
