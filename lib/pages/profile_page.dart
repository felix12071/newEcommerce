// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/other_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,

      ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 60,
                  child: Icon(Icons.person,size: 50, color: Colors.black,),
                ),
              ),
            ),
            OtherTile(text: 'First Name: '),
            OtherTile(text: 'Last Name'),
            OtherTile(text: 'Tell: '),
            OtherTile(text: 'Mail:'),


          ],
        ),

    );
  }
}
