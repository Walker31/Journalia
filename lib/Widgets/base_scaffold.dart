import 'package:flutter/material.dart';
import 'package:journalia/Widgets/drawer.dart';
import 'background.dart';
import 'bottom_nav_bar.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String? title;

  const BaseScaffold({super.key, required this.body, this.title});

  @override
  BaseScaffoldState createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(decoration: appBackgroundDecoration, child: widget.body),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
