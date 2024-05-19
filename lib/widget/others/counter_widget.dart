import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      InkWell(
          onTap: () {
            setState(() {
              if (count > 0) {
                count--;
              }
            });
          },
          child: Container(
            margin:
                EdgeInsets.only(
                  right: Dimensions.paddingSizeHorizontal * 0.21,
                  left: Dimensions.paddingSizeHorizontal * 0.21,
                  ),
            alignment: Alignment.center,
            height: Dimensions.heightSize * 1.6,
            width: Dimensions.widthSize * 2.3,
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
            child: Icon(
              Icons.remove,
              color: AppColor.whiteColor,
              size: 15.r,
            ),
          ),
        ),
        Container(
           alignment: Alignment.center,
        height: Dimensions.heightSize * 1.6,
          width: Dimensions.widthSize * 2.3,
      
          decoration: BoxDecoration(
            border: Border.all(width: 1,
            color: AppColor.primaryColor),
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
          child: Text(
            count.toString(),
            style: CustomStyle.mediumTextStyle.copyWith(
              color: AppColor.primaryColor
            )
          ),
        ),
       InkWell(
        onTap: (){
           setState(() {
              count++;
        });},
         child: Container(
          margin: EdgeInsets.only(
            left: Dimensions.paddingSizeHorizontal*0.2,
            right: Dimensions.paddingSizeHorizontal*0.2,
          ),
          alignment:Alignment.center,
          height: Dimensions.heightSize * 1.6,
            width: Dimensions.widthSize * 2.3,
            padding: EdgeInsets.all(
              Dimensions.paddingSize*0.2
            ),
            decoration:  BoxDecoration(
                             color: AppColor.primaryColor,
         
         borderRadius: BorderRadius.circular(Dimensions.radius*0.5)
            ),
            child:  Icon(Icons.add,
              color: AppColor.whiteColor
              ,size: 15.r,
            ),
         
            
          ),
       ),
      ],
    );
  }
}
