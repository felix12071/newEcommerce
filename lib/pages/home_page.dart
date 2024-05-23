// ignore_for_file: prefer_const_constructors

import 'package:caproject_ecommerce_app/pages/introPage.dart';
import 'package:caproject_ecommerce_app/pages/profile_page.dart';
import 'package:caproject_ecommerce_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logOut(){showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text('Log Out'),
        content: Text('You have logged out!'),
      ));
    Navigator.push(context, MaterialPageRoute(builder:  (context) => IntroPage(),
    ),
    );


  }
  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
                Icons.menu),
          onPressed: (){
              Scaffold.of(context).openDrawer();
          },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
              image: DecorationImage(
                  image: AssetImage('lib/Images/textured-dark-vignette-black-background.webp'),
                  fit: BoxFit.cover

              ),
              ),
                accountName:Text('accountName') ,
                accountEmail: Text('email@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.person),
              ),
            ),
            ),

           Column(

             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                   },
                   child: ListTile(
                     leading: Icon(Icons.person, color: Colors.white,),
                     title: Text('profile', style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: GestureDetector(
                   onTap: (){},
                   child: ListTile(
                     leading: Icon(Icons.delivery_dining_sharp, color: Colors.white,),
                     title: Text('Orders', style: TextStyle(color: Colors.white),),
                     trailing: CircleAvatar(
                       backgroundColor: Colors.red[400],
                       radius: 10,
                       child: Text('3',style: TextStyle(
                           fontSize: 10,
                       fontWeight: FontWeight.w700),),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
                   },
                   child: ListTile(
                     leading: Icon(Icons.settings, color: Colors.white,),
                     title: Text('Settings', style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: GestureDetector(
                   onTap: (){},
                   child: ListTile(
                     leading: Icon(Icons.share, color: Colors.white,),
                     title: Text('Share', style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: GestureDetector(
                   onTap: (){

                   },
                   child: ListTile(
                     leading: Icon(Icons.favorite_outlined, color: Colors.white,),
                     title: Text('Favourites', style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ),
             ],
           ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,bottom: 25.0),
              child: GestureDetector(
                onTap: (
                logOut
                ),
                child: ListTile(
                  leading: Icon(Icons.logout_outlined, color: Colors.white,),
                  title: Text('Log Out', style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],

        ),
      ),
      body: _pages[_selectedIndex],

    );
  }
}
