import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({Key? key, required this.shoe}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(9),
        ),
        margin: const EdgeInsets.only(bottom: 25),
        child: ListTile(
          leading: Image.network("http://www.nattiee.com/ecom/pimages/${widget.shoe.image}",
           // Assuming the image property holds the asset path
            width: 80, // Adjust the width as needed
            height: 80, // Adjust the height as needed
          ),
          title: Text(widget.shoe.name),
          subtitle: Text(widget.shoe.price),
          trailing: IconButton(
            onPressed: removeItemFromCart,
            icon: const Icon(Icons.delete_forever),
          ),
        ),
      ),
    );
  }
}