// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:caproject_ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'shop_page.dart';

class ItemPage extends StatefulWidget {
  Shoe shoe;

  ItemPage({super.key,required this.shoe});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemsToCart(shoe);
    //   alert user
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text('Successfully added'),
          content: Text('Check your cart'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                width: double.maxFinite,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40) ,
                        bottomRight: Radius.circular(40))
                ),
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            ),
                            child: Center(
                              child: Image.asset(widget.shoe.image,
                                width:double.maxFinite,
                                height: 300,
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                        child: Text(widget.shoe.name, style: TextStyle(color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),),
                      ),
                      Text(widget.shoe.description,style: TextStyle(
                          fontSize: 15
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(widget.shoe.price,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Size',style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: sizes.map((size) {
                                  return ElevatedButton(

                                    onPressed: () {
                                      // Add your logic for button onPressed here
                                      print('Selected size: $size');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero, // Remove circular border here
                                      ),
                                      backgroundColor: Colors.grey[300], // Change button color here
                                      textStyle: TextStyle(fontSize: 15),// Change text size here

                                    ),

                                    child: Text(size),

                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                ),

              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.shoe.description,style: TextStyle(
                    fontSize: 15
                ),),

              ),


              GestureDetector(
                onTap: () =>
                    addShoeToCart(widget.shoe),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Center(
                      child: Text('Add To Cart',
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
          )

      ),
    );
  }
}
