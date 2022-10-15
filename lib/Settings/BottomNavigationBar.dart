import 'package:bre/widget/HomeScreen.dart';
import 'package:bre/widget/Profile.dart';
import 'package:flutter/material.dart';

import '../Icons/b_r_e_icons_icons.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  List _screens = [HomeScreen(), Profile()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (_updateIndex),
        selectedItemColor: Color.fromARGB(255, 128, 90, 73),
        selectedFontSize: 18,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon:  Icon(
              BREIcons.homeSvgrepoCom,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              BREIcons.clientProfileSvgrepoCom,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
