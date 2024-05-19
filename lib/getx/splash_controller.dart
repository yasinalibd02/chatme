
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
      const Duration(seconds: 3),        
      () {
        Get.offAllNamed(
          LocalStorage.isLoggedIn()
              ? Routes.signInScreen
              : LocalStorage.isOnBoardDone()
                ? Routes.signInScreen
                  : Routes.welcomeScreen,
        );
      },
    );
  }
}
