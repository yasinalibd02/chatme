import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  AppColor.primaryColor.withOpacity(0.4),
      surfaceTintColor: AppColor.primaryColor.withOpacity(0.4),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Handle category selection
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
               width: 100,
              height: 100,
            
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius*1.4
                ),
                image: DecorationImage(image: AssetImage(
                    imageUrl,
                   
                  ),
                  
                    fit: BoxFit.cover,
                  )
              ),
             
            ),
            spaceVer(Dimensions.heightSize*0.5),
            Text(
              title,
              style:CustomStyle.mediumTextStyle
            ),
          ],
        ),
      ),
    );
  }
}
