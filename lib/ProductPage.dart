import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartController.dart';
import 'CartPage.dart';

class ProductPage extends StatelessWidget {
  final _shoeName = [
    'Kaptir Super',
    'Ultra Boost',
    'Ultra DNA',
    'Air Force Flyknit',
    'Pegasis Trail',
    'React Infinity'
  ];

  final _shoePrice = [
    '\$128.0',
    '\$132.0',
    '\$139.0',
    '\$205.0',
    '\$146.0',
    '\$130.0'
  ];

  @override
  Widget build(BuildContext context) {
    //Inject GetXController
    var cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          //the red circle
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 150.0,
                width: 30.0,
                child: InkWell(
                  splashColor: Colors.redAccent,
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
                          child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          Positioned(
                              top: 3.0,
                              right: 7,
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    cartController.count.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )),
                        ],
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.blueAccent,
            highlightColor: Colors.blueAccent.withOpacity(1.0),
            onTap: () {
              cartController.addToCart(index);
            },
            child: _buildGridCards(index, 'images/shoe_${index + 1}.jpg',
                _shoeName[index], _shoePrice[index]),
          );
        },
      ),
    );
  }

  Widget _buildGridCards(
      int index, String imgPath, String shoeName, String shoePrice) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          //Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
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
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
            ),
          ),
          Spacer(),
          //Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoeName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                shoePrice,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
