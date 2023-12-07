import 'package:get/get.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  //Getters
  get cart => _cart;
  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  //business logic
  void addToCart(String imageName, int size, int quantity) {
    cart[imageName + '_' + size.toString()] = quantity;
    update();
  }

  void clear(String imageName, int size) {
    cart.remove(imageName + '_' + size.toString());
    update();
  }
}
