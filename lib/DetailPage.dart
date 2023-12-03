import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  List<bool> isSelected = [false, true, false, false, false]; // Selection state

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
                      right: -3,
                      top: 0,
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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Hero(
              tag: widget.imageTag, // Use the received tag for Hero animation
              child: Image.asset(
                widget.imagePath, // Use the received image path
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
                    // Add more images for different sizes as needed
                  ],
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = buttonIndex == index;
                      }
                      // Handle size selection here if needed
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
