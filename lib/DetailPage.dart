import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartController.dart';
import 'CartPage.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject GetXController
    var cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          //the orange circle
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: InkWell(
                focusColor: Colors.orangeAccent,
                highlightColor: Colors.blueAccent.withOpacity(0.5),
                onTap: () {
                  Get.to(() => CartPage());
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    Positioned(
                      right: 0, // Set the right property to 0
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.orange),
                          Positioned(
                            top: 3.0,
                            right: 7,
                            child: Center(
                              child: Obx(
                                () => Text(
                                  cartController.count.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
