import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartController.dart';
import 'ProductPage.dart';

class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(() => ProductPage());
            }),
        title: Text("Your Cart"),
        actions: [
          Center(
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'Total: ' + cartController.cartCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.cart.length,
          itemBuilder: (context, index) {
            String cartKey = cart.keys.toList()[index];
            int size = cart[cartKey]['size'];
            int count = cart[cartKey]['quantity'];
            String imagePath = cart[cartKey]['imagePath'];

            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Quantity: $count, Size: $size'),
              trailing: IconButton(
                icon: Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  cartController.clear(cartKey);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
