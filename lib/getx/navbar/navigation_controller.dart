
import 'package:chatme/views/dashboard/notification_screen.dart';
import 'package:chatme/views/dashboard/profile_screen.dart';
import 'package:get/get.dart';
import '../../views/dashboard/categores_screen.dart';
import '../../views/dashboard/home_screen.dart';
class NavigationController extends GetxController {
  final RxInt selectedIndex = 2.obs;

  final List page = [
    const HomeScreen(),
    const CategoriesScreen(),
    const NotificationScreen(),
     ProfileScreen(),
  ];

  void selectedPage(int index) {
    selectedIndex.value = index;
  }
  // get onTransaction => Routes.transactionScreen.toNamed;
  // get onChangePassword => Routes.changePasswordScreen.toNamed;
  // get onTwoFaVerification => Routes.twoFaVerificationScreen.toNamed;
}
