import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import 'CartController.dart';
import 'CartPage.dart';

class DetailPage extends StatefulWidget {
  final String imageTag;
  final String imagePath;
  final String imageName;

  const DetailPage({Key key, this.imageTag, this.imagePath, this.imageName})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false
  ]; // Selection state
  bool isSizeSelected = false; // Track if size is selected
  bool isQuantitySelected = false; // Track if quantity is selected
  int selectedSizeIndex; // Define selectedSizeIndex

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
                onTap: () async {
                  Get.to(() => CartPage());
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      color: Colors.white,
                      onPressed: (isSizeSelected && isQuantitySelected)
                          ? () {
                              Get.to(() => CartPage());
                            }
                          : null,
                    ),
                    Positioned(
                      right: -3,
                      top: 0,
                      child: Badge(
                        badgeContent: Obx(
                          () => Text(
                            cartController.count.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        position: BadgePosition.topEnd(top: 3, end: 7),
                        badgeColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),

          //Image
          Container(
            alignment: Alignment.center,
            child: Hero(
              // received tag for Hero animation
              tag: widget.imageTag,
              child: Image.asset(
                widget.imagePath,
                width: 300,
                height: 280,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.imageName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          //ShoeSize
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Shoe Size:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ToggleButtons(
                  children: [
                    buildSizeImage('images/size_36.png', 36),
                    buildSizeImage('images/size_37.png', 37),
                    buildSizeImage('images/size_38.png', 38),
                    buildSizeImage('images/size_39.png', 39),
                    buildSizeImage('images/size_40.png', 40),
                  ],
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = buttonIndex == index;
                      }
                      selectedSizeIndex = index + 36;
                      isSizeSelected = true;
                    });
                  },
                  fillColor: Colors.blue,
                  selectedColor: Colors.white,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 40.0,
                  ),
                ),
              ],
            ),
          ),

          //Quantity
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Quantity:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (selectedSizeIndex != null) {
                      // Add item to cart
                      cartController.addToCart(
                          widget.imageName,
                          selectedSizeIndex,
                          1,
                          widget
                              .imagePath); 
                      setState(() {
                        isQuantitySelected = true;
                      });
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Obx(
                    () {
                      final quantity = cartController.cart[widget.imageName];
                      return Text(
                        (quantity ?? 0).toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (selectedSizeIndex != null) {
                      // Remove 1 item from cart
                      cartController.clear(widget.imageName, selectedSizeIndex);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSizeImage(String imagePath, int size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color for unselected images
        ),
        color: isSelected[size - 36] ? Colors.blue : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 35, // Adjust the width and height of the images
          height: 35,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
