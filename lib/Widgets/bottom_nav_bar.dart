import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;
  Logger logger=Logger();
  
  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      logger.d('Selected Index changed to: $_selectedIndex');
    });
    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/home');
        break;
      case 1:
        Navigator.of(context).pushNamed('/feed');
        break;
      case 2:
        Navigator.of(context).pushNamed('/createpost');
        break;
      case 3:
        Navigator.of(context).pushNamed('/profile');
        break;
      case 4:
        Navigator.of(context).pushNamed('/login');
        break;
    }
    // Update selected index after navigation
    
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: tertiaryColor,
      unselectedItemColor: accentColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(
          icon: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Center(
              child: Icon(Icons.add, color: Colors.black),
            ),
            
          ),
          label: 'Create Post',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Profile'),
        const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
