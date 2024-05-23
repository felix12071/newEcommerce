import 'package:flutter/material.dart';

import '../components/other_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: (
      const Column(
        children: [
          OtherTile(text: 'Share App',sufIcon: Icons.arrow_forward_ios,),
          OtherTile(text: 'Theme',sufIcon: Icons.arrow_forward_ios,),
          OtherTile(text: 'Privacy Policy',sufIcon: Icons.arrow_forward_ios,),
          OtherTile(text: 'About us!',sufIcon: Icons.arrow_forward_ios,)
        ],
      )
      ),

    );
  }
}
