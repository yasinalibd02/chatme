import 'package:chatme/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final otpController = TextEditingController();

  get goToOtpScreen => Routes.forgotOtpScreen;
  get goToResetPassword => Routes.resetPasswordScreen;
}
