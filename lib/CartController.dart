import 'package:get/get.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  //Getters
  get cart => _cart;
  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  // Business logic
  void addToCart(String imageName, int size, int quantity, String imagePath) {
    String cartKey = '$imageName$size';
    if (_cart.containsKey(cartKey)) {
      _cart[cartKey]['quantity'] += 1;
    } else {
      _cart[cartKey] = {
        'imageName': imageName,
        'size': size,
        'quantity': 1,
        'imagePath': imagePath,
      };
    }
    update();
  }

  void clear(String cartKey) {
    _cart[cartKey]['quantity']--;
    if (_cart[cartKey]['quantity'] == 0) {
      _cart.remove(cartKey);
    }
    update();
  }
}
