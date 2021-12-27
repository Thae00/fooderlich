import 'package:flutter/material.dart';
import 'package:fooderlich/screen/card1.dart';

// 1
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Add state variables and functions
  int _selectedIndex = 0;
  static List<Widget> pages = [
    //Replace with Card
    Card1(),
    //Replace with Card2
    Container(
      color: Colors.green,
    ),
    //Replace with Card3
    Container(
      color: Colors.blue,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Fooderlich',
            // 2
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      // Show selected tab
      body: pages[_selectedIndex],
      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // Set selected tab bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card3'),
        ],
      ),
    );
  }
}
