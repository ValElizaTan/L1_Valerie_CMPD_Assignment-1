import 'package:get/get.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  //Getters
  get cart => _cart;
  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  // Business logic
  void addToCart(String imageName, int size, int quantity, String imagePath) {
    String cartKey = '$imageName';
    if (_cart.containsKey(cartKey)) {
      if (_cart[cartKey]['size'] == size) {
        _cart[cartKey]['quantity'] += quantity;
      } else {
        _cart[cartKey]['size'] = size;
        _cart[cartKey]['quantity'] = quantity;
      }
    } else {
      _cart[cartKey] = {
        'imageName': imageName,
        'size': size,
        'quantity': quantity,
        'imagePath': imagePath,
      };
    }
    update();
  }

  void remove(String imageName) {
    String cartKey = '$imageName';
    if (_cart.containsKey(cartKey)) {
      if (_cart[cartKey]['quantity'] > 0) {
        // Remove 1 item from the cart
        _cart[cartKey]['quantity']--;
        if (_cart[cartKey]['quantity'] == 0) {
          // Remove ALL item from cart
          _cart.remove(cartKey);
        }
        update();
      }
    }
  }

  void clear(String cartKey) {
    if (_cart.containsKey(cartKey)) {
      _cart.remove(cartKey);
      update();
    }
  }
}
