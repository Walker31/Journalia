import 'package:flutter/material.dart';
import 'background.dart';
import 'bottom_nav_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;

  const BaseScaffold({super.key, required this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: appBackgroundDecoration,child: body),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
