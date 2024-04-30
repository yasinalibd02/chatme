
import 'dart:async';

import 'package:get/get.dart';

import '../backend/local_storage.dart';
import '../constants/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
      const Duration(seconds: 5),
      () {
        Get.offAllNamed(
          LocalStorage.isLoggedIn()
              ? Routes.splashScreen
              : LocalStorage.isOnBoardDone()
                  ? Routes.welcomeScreen
                  : Routes.signInScreen,
        );
      },
    );
  }
}
