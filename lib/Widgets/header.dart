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
          icon: const Icon(Icons.menu, size: 36),
        ),
        
        const Text(
          "Journalia",
          style: TextStyle(
            fontFamily: 'Caveat',
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
        IconButton(
          onPressed: () {
            logger.d('Person icon button pressed!');
          },
          icon: const Icon(Icons.person, size: 36),
        ),
      ],
    );
  }
}
