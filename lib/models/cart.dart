import 'dart:core';

// import 'package:cab_booking/models/watch.dart';
import 'package:flutter/material.dart';

import 'watch.dart';

class Cart extends ChangeNotifier {
  // list of watch for sale
  List<Watch> watchShop = [
    Watch(
        name: 'Wave Beat',
        price: '₹1,999',
        imagePath: 'lib/images/w2.png',
        description: 'Embrace the Digital Revolution on Your Wrist'),
    Watch(
        name: 'Xtend',
        price: '₹3,499',
        imagePath: 'lib/images/w3.png',
        description: 'Unlock Limitless Possibilities on Your Wrist'),
    Watch(
        name: 'Storm Pro',
        price: '₹4,999',
        imagePath: 'lib/images/w4.png',
        description: 'Ride the Wave of Smartwatch Innovation'),
    Watch(
        name: 'Wave call',
        price: '₹1,799',
        imagePath: 'lib/images/w5.png',
        description: 'Your Gateway to Smart Timekeeping')
  ];
  // list of item in user cart
  List<Watch> userCart = [];
  // at beginning it is blank
  // get list of watch for sale
  List<Watch> getWatchList() {
    return watchShop;
  }

  // get cart
  List<Watch> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Watch watch) {
    userCart.add(watch);
    notifyListeners();
  }

  // add item to cart
  void removeItemFromCart(Watch watch) {
    userCart.remove(watch);
    notifyListeners();
  }
}
