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
           //!>>>>>>>>   started remove
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

           //!>>>>>>>>   started count
        Container(
           alignment: Alignment.center,
        height: Dimensions.heightSize * 1.75,
          width: Dimensions.widthSize * 2.5,
      
          decoration: BoxDecoration(
            border: Border.all(width: 1,
            color: AppColor.primaryColor),
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
          child: Text(
            count.toString(),
            style: CustomStyle.mediumTextStyle.copyWith(
              color: AppColor.primaryColor,
              fontSize: Dimensions.headingTextSize4
            )
          ),
        ),


        //!>>>>>>>>   started add
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
