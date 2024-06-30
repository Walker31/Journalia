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
    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/feed');
        break;
      case 2:
        Navigator.pushNamed(context, '/createpost');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
      case 4:
        Navigator.pushNamed(context, '/login');
        break;
    }
    // Update selected index after navigation
    setState(() {
      _selectedIndex = index;
      logger.d('Selected Index changed to: $_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: tertiaryColor,
      unselectedItemColor: accentColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
