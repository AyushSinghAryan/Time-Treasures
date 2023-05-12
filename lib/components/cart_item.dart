import 'package:cab_booking/models/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  Watch watch;
  CartItem({super.key, required this.watch});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart

  void removeItemfromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.watch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.watch.imagePath),
        title: Text(widget.watch.name),
        subtitle: Text(widget.watch.price),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemfromCart,
        ),
      ),
    );
  }
}
