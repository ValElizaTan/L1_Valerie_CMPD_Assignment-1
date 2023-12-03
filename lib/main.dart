import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DetailPage.dart';
import 'ProductPage.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductPage(),
    );
  }
}
