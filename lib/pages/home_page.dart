import 'package:cab_booking/components/bottom_nav_bar.dart';
// import 'package:cab_booking/pages/cart_page.dart';
import 'package:cab_booking/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;
  // zero for home , one for the cart
  // this method will update our seelcted index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      // print(index);
      // print(_selectedIndex);
    });
  }

  // pages to navigate between
  // widget type list
  final List<Widget> _pages = [
    // shope page
    ShopPage(),

    // cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        // onTabChange: (index) {
        //   print(index);
        // },
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Color(0xFFcf2d2d),
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // logo
            DrawerHeader(
              child: Image.asset('lib/images/boatlogo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xFFcf2d2d),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Color(0xFFcf2d2d)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Color(0xFFcf2d2d),
                ),
                title: Text(
                  'About',
                  style: TextStyle(color: Color(0xFFcf2d2d)),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xFFcf2d2d),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Color(0xFFcf2d2d)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
