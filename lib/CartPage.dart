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

            return Card(
              color: Colors.cyan[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //  Image
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: const Offset(
                                2.0,
                                2.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ]),
                    ),
                  ),
                  Spacer(),
                  //  Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity: $count',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Size: $size',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      cartController.clear(cartKey);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
