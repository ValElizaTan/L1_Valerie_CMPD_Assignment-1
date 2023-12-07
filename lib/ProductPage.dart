import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DetailPage.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.blueAccent,
            highlightColor: Colors.blueAccent.withOpacity(1.0),
            onTap: () {
              Get.to(
                () => DetailPage(
                  // Pass tag to DetailPage
                  imageTag: 'shoeImage$index', 
                  imagePath: 'images/shoe_${index + 1}.jpg',
                  imageName: _shoeName[index],
                ),
              );
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
          //Image with Hero animation
          Hero(
            tag: 'shoeImage$index',
            child: Padding(
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
            onPressed: () {
              Get.to(
                () => DetailPage(
                  imageTag: 'shoeImage$index', // Pass the tag to DetailPage
                  imagePath: 'images/shoe_${index + 1}.jpg',
                  imageName: _shoeName[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
