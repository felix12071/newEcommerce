// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:caproject_ecommerce_app/services/login_or_registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //   logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('lib/Images/nike-4-logo-png-transparent.webp',
              height: 240,
              ),
            ),

          const SizedBox(height: 48),

          //   title
            Text('Just Do it',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
            ),

          const SizedBox(height: 24,),

          Text('Brand new sneakers and custom kicks made with premium quality',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24,),

          //   start now button
      GestureDetector(
        onTap: () {
          // Provider.of<Cart>(context, listen: false).getProducts(); // Call getProducts()
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginOrRegister(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(
                'Shop now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          ],
        ),
      ),

    );
  }
}
