// custom_drawer.dart
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {

  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  List<bool> isSelected = [true, false]; // Initial state, assuming light mode is selected

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.home,size: 48),
          ),
          ListTile(
            title: const Text('Settings'),
            trailing: const Icon(Icons.settings),
            onTap: () {
              // Handle the tap event
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleButtons(
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                    isSelected[buttonIndex] = buttonIndex == index;
                  }
                });
              },
              children: const <Widget>[
                Icon(Icons.light_mode),
                Icon(Icons.dark_mode),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
