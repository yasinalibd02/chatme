
import '/constants/app_assets.dart';
import '/constants/app_colors.dart';
import '/constants/app_strings.dart';
import '/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sized.dart';
import '../../constants/routes.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppAssets.welcome,
                    ),
                    fit: BoxFit.cover,
                    ),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                     ),
          SizedBox(
           height:  Dimensions.heightSize*4),

           const Text("BANCO",
           style: TextStyle(
              fontSize: 32,
              color: AppColor.primaryColor,
            ),
            ),
          SizedBox(height:  Dimensions.heightSize),
           FittedBox(
            child: Text( 
                AppString.welcomeSubTitle.tr
                 ,style: const TextStyle(
                  fontSize: 20,
                   color: AppColor.primaryColorOpacity,
                  
                 ),
                 ),
          ),
          const Spacer(),
        
          CommonButton(
width:MediaQuery.sizeOf(context).width*0.6,
            title: AppString.getStarted.tr,
            onPressed: () {
              Get.toNamed(Routes.signInScreen);
            },
            borderColor: AppColor.primaryColor,
            buttonColor: AppColor.primaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize*3,
          )
          
        ],
      ),
    );
  }
}
