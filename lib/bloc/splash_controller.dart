
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
   

        /// check open app from deep link or not?
        /// get true/false value
        /// then sign in >> call marketplace get data
        /// show in dialog
        /// then remove local data
        Get.offAllNamed(
          LocalStorage.isLoggedIn()
              ? Routes.signInScreen
              : LocalStorage.isOnBoardDone()
                  ? Routes.signInScreen
                  : Routes.onboardScreen,
        );
      },
    );
  }
}
