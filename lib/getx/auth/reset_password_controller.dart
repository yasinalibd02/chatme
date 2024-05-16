import 'package:chatme/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  get goToSignInScreen => Routes.signInScreen;
 
}
