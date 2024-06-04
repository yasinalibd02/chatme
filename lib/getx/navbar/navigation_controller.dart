
import 'package:chatme/views/dashboard/notification_screen.dart';
import 'package:chatme/views/dashboard/profile_screen.dart';
import 'package:get/get.dart';
import '../../views/dashboard/categories/categores_screen.dart';
import '../../views/dashboard/home_screen.dart';
class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List page = [ 
     HomeScreen(),
    const CategoriesScreen(),
    const NotificationScreen(),
     ProfileScreen(),
  ];

  void selectedPage(int index) {
    selectedIndex.value = index;
  }

}
