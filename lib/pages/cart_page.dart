// ignore_for_file: prefer_const_constructors


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import 'package:http/http.dart' as http;
import '../models/shoe.dart';
import '../services/login_or_registration.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder:(context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: const Text('My Cart',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
          ),
        ),

        const SizedBox(height: 10,),
        
        Expanded(child: ListView.builder(
          itemCount: value.getUserCart().length,
          itemBuilder: (context, index){
        //   get individual shoe
          Shoe individualShoe = value.getUserCart()[index];
        //   return cart item
          return CartItem(shoe: individualShoe,);
        },)),
        GestureDetector(
          onTap: () => showDialog(context: context,
              builder: (context) => AlertDialog(
                title: Text('Order'),
                content: Text('Your order has been received succesfully'),


            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text('Check Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        )

      ],
        ),
    );
  }


}
