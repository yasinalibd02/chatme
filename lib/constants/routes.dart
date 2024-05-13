import 'package:chatme/getx/bindings/bindings.dart';
import 'package:get/get.dart';

import '../views/auth/sign_in_screen.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/begins/splash_screen.dart';
import '../views/begins/welcome_screen.dart';
import '../views/dashboard/navigation_screen.dart';
import '../views/drawer/change_language_screen.dart';
import '../views/drawer/change_password_screen.dart';

class Routes {
  static const String splashScreen = '/splash';
  static const String welcomeScreen = '/welcome';
  static const String signInScreen = '/signinScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String changeLanguageScreen = '/changeLanguageScreen';
  static const String changePasswordScreen = '/changePasswordScreen';

  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding()
   
    ),
     GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
     GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
     GetPage(
      name: Routes.navigationScreen,
      page: () => NavigationScreen(),
    ),
    GetPage(
      name: Routes.changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
    ),
     GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
  ];
}
