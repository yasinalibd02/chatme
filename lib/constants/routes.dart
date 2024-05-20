import 'package:chatme/getx/bindings/bindings.dart';
import 'package:get/get.dart';

import '../views/auth/forgot_otp_screen.dart';
import '../views/auth/forgot_password_screen.dart';
import '../views/auth/registration_otp_screen.dart';
import '../views/auth/reset_password_screen.dart';
import '../views/auth/sign_in_screen.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/begins/splash_screen.dart';
import '../views/begins/welcome_screen.dart';
// import '../views/dashboard/categories/products_screen.dart';
// import '../views/dashboard/categories/order_screen.dart';
import '../views/dashboard/navigation_screen.dart';
import '../views/drawer/change_language_screen.dart';
import '../views/drawer/change_password_screen.dart';
import '../views/drawer/history_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String signInScreen = '/signinScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String forgotOtpScreen = '/forgotOtpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String registrationOtpScreen = '/registrationOtpScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String changeLanguageScreen = '/changeLanguageScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String filterCategoriesScreen = '/filterCategoriesScreen';
  static const String productScreen = '/productScreen';
  static const String orderScreen = '/orderScreen';
  static const String historyScreen = '/historyScreen';

  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding()
   
    ),
     GetPage(
      name: Routes.welcomeScreen,
      page: () =>  const WelcomeScreen(),
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
      name: Routes.forgotPasswordScreen,
      page: () =>  ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.forgotOtpScreen,
      page: () =>  ForgotOtpScreen(),
    ),
     GetPage(
      name: Routes.resetPasswordScreen,
      page: () =>  ResetPasswordScreen(),
    ),
     GetPage(
      name: Routes.registrationOtpScreen,
      page: () =>  RegistrationOtpScreen(),
    ),

     GetPage(
      name: Routes.navigationScreen,
      page: () => NavigationScreen(),
    ),
    GetPage(
      name: Routes.changeLanguageScreen,
      page: () =>  const ChangeLanguageScreen(),
    ),
     GetPage(
      name: Routes.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
      GetPage(
      name: Routes.historyScreen,
      page: () =>  HistoryScreen(),
    ),
    //   GetPage(
    //   name: Routes.productScreen,
    //   page: () => const ProductScreen(),
    // ),
    //   GetPage(
    //   name: Routes.orderScreen,
    //   page: () => const OrderScreen(),
    // ),
  ];
}
