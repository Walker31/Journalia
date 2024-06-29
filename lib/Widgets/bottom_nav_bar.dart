// bottom_nav_bar.dart
import 'package:flutter/material.dart';
import '../../colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Navigate to Explore
        Navigator.pushNamed(context, '/feed');
        break;
      case 2:
        // Navigate to Library
        Navigator.pushNamed(context, '/sample');
        break;
      case 3:
        // Navigate to Profile
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: secondaryColor,
      selectedItemColor: tertiaryColor,
      unselectedItemColor: accentColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
