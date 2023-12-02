import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartController.dart';


class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;

    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
          actions: [
            Center(
              child: Obx( ()=>Text(
                'Total: ' + cartController.cartCount.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
           ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            int cartIndex = cart.keys.toList()[index]; //keys -> array
            int count = cart[cartIndex];    //Quantity
            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/shoe_${cartIndex + 1}.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              title: Text('Quantity: $count'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    cartController.clear(cartIndex);
                  }),
            );
          },
        ));
  }
}
