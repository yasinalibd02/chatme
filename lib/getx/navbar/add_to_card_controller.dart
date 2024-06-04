import 'package:get/get.dart';
import '../../backend/models/categores_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }
}
