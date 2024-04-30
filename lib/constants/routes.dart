import 'package:get/get.dart';

import '../views/begins/splash_screen.dart';
import '../views/begins/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/splash';
  static const String welcomeScreen = '/welcome';
  static const String signInScreen = '/welcome';

  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
   
    ),
     GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
  ];
}
