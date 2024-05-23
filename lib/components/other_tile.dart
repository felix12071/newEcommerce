// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OtherTile extends StatelessWidget {
  final String text;
  final IconData? sufIcon;
  const OtherTile({super.key,required this.text, this.sufIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87
                      ),

                    ),
                  ),
                  Icon(sufIcon),
                ],
              ),
            ),
      ),
    );
  }
}
