import 'package:chatme/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
body:Container(
  alignment: Alignment.center,
  child: Image.asset(AppAssets.logo)),
    );
  }
}