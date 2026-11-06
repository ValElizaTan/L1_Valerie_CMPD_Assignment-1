# Sneaker Shop – Flutter Shopping Cart App

A small Flutter shopping app for sneakers. You browse a product list, open a shoe to see it larger, pick your size (36–40), add it to your cart and manage the quantities. Built as Assignment 1 for the CMPD module (Module Group L1) at Nanyang Polytechnic.

## Features

- **Product list:** six sneakers with image, name and price:

  | Shoe | Price |
  |------|-------|
  | Kaptir Super | $128 |
  | Ultra Boost | $132 |
  | Ultra DNA | $139 |
  | Air Force Flyknit | $205 |
  | Pegasis Trail | $146 |
  | React Infinity | $130 |

- **Detail page:** a large image with a Hero animation from the list, a size selector (toggle buttons for EU 36–40), and add/remove buttons with a live quantity.
- **Remembers your size:** the last selected shoe size is saved with `shared_preferences` and restored the next time you open the detail page.
- **Cart badge:** a badge in the app bar shows the number of items in the cart and updates instantly through GetX.
- **Cart page:** each item's image, size and quantity, with buttons to reduce the quantity or clear the item, plus the total item count.

## Tech stack

- Flutter / Dart (SDK `>=2.7.0 <3.0.0`, pre-null-safety)
- [`get`](https://pub.dev/packages/get) – reactive cart state (`CartController`) and navigation
- [`badges`](https://pub.dev/packages/badges) – cart count badge
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) – saves the selected shoe size

## Project structure

```
lib/
├── main.dart            # App entry ("Shopping Cart"), opens ProductPage
├── ProductPage.dart     # List of sneakers with prices
├── DetailPage.dart      # Hero image, size selector, add/remove, cart badge
├── CartController.dart  # GetX controller: add, remove, clear, count
└── CartPage.dart        # Cart items with size & quantity
images/
├── shoe_1.jpg … shoe_6.jpg
└── size_36.png … size_40.png
```

## Getting started

This project targets an older, pre-null-safety Flutter SDK (Flutter 1.22 / 2.x era). Use a matching Flutter version (for example via [FVM](https://fvm.app/)) or migrate the code first.

```bash
flutter pub get
flutter run
```

> The package name in `pubspec.yaml` is still `lab_4test`, carried over from the lab template this assignment started from.

## Author

Valerie Tan Wan Xin – Nanyang Polytechnic, L1_Valerie_CMPD_Assignment 1
