// custom_header.dart
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CustomHeader extends StatelessWidget {
  final Logger logger = Logger();

  CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            logger.d('Menu icon button pressed!');
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu, size: 36,color: Colors.black,),
        ),
        
        const Text(
          "JOURNALIA",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Caveat',
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
        IconButton(
          onPressed: () {
            logger.d('Person icon button pressed!');
            Navigator.pushNamed(context,'/profile');
          },
          icon: const CircleAvatar(backgroundImage: AssetImage('assets/Profile.png'),)
        ),
      ],
    );
  }
}
