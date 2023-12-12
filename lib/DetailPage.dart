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
  //  ToggleBTN shoesize
  List<bool> isSelected = [false, false, false, false, false];
  //  Shoesize selected
  bool isSizeSelected = false;
  //  Quantity selected
  bool isQuantitySelected = false;
  String selectedSize = '';

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['36', '37', '38', '39', '40'];
    //  Inject GetXController
    var cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          //  The orange circle
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
                      onPressed: isSizeSelected && isQuantitySelected
                          ? () {
                              Get.to(() => CartPage());
                            }
                          : null,
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
                                  cartController.cartCount.toString(),
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
          //  Image
          Container(
            alignment: Alignment.center,
            child: Hero(
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
          //  ShoeSize
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
                    _buildSizeImage('images/size_36.png', 36),
                    _buildSizeImage('images/size_37.png', 37),
                    _buildSizeImage('images/size_38.png', 38),
                    _buildSizeImage('images/size_39.png', 39),
                    _buildSizeImage('images/size_40.png', 40),
                  ],
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                      isSizeSelected = true;
                      selectedSize = sizes[index];
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
                    if (isSizeSelected) {
                      setState(() {
                        cartController.addToCart(
                          widget.imageName,
                          int.parse(selectedSize),
                          1,
                          widget.imagePath,
                        );
                        isQuantitySelected = true;
                      });
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Obx(
                    () {
                      final cartKey = '${widget.imageName}$selectedSize';
                      final quantity = cartController.cart[cartKey];
                      return Text(
                        (quantity != null ? quantity['quantity'] : 0)
                            .toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cartController.remove(widget.imageName, selectedSize);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeImage(String imagePath, int size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        color: isSelected[size - 36] ? Colors.blue : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 35,
          height: 35,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
