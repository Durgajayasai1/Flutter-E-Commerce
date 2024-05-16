import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // list of products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Black Hoodie",
      price: 40.5,
      description:
          "Relaxed fit with a lined, double hood , dropped shoulders and long sleeves.",
      imagPath: 'assets/hoodie.png',
    ),
    // product 2
    Product(
      name: "DECKER Analog Watch",
      price: 51.37,
      description: "Feature quartz movements and are made from materials like stainless steel and leather.",
      imagPath: 'assets/fossil.png',
    ),
    // product 3
    Product(
      name: "Apex Highs: Black",
      price: 23.95,
      description: "Shop for Apex Highs: Black Men High Top Sneakers at The Souled Store.",
      imagPath: 'assets/shoes.png',
    ),
    // product 4
    Product(
      name: "Metal Round Sunglasses",
      price: 4.35,
      description: "Black Steampunk Round Sunglasses for Men",
      imagPath: 'assets/glasses.png',
    ),
  ];
  // list of user cart
  List<Product> _cart = [];
  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  // add items to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove items from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
