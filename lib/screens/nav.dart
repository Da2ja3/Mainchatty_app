import 'package:chatty_app/screens/profile.dart';
import 'package:flutter/material.dart';

import '../page/chattyapp.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex=0;
  static final List<Widget> _widgetsOptions=<Widget>[
    ChattyApp(),
    Profile(),

  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetsOptions[_selectedIndex],
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:_onItemTapped ,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile'),

        ],

      ) ,
    );
  }
}
