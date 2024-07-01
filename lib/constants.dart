import 'package:flutter/material.dart';
import 'package:journalia/colors.dart';
import 'package:logger/logger.dart';

Logger logger =Logger();

final List<String> topics = [
    "Random",
    "Raising Issues",
    "Resource Sharing",
    "New Initiatives",
    "Clubs",
    "Experience Sharing",
    "Internship",
    "Politics"
  ];

  final List<String> communityList = ['Community 1', 'Community 2', 'Community 3'];

  AppBar buildAppBar(BuildContext context) {
  return AppBar(
    actions: [Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu,color: primaryTextColor,),
        );
      },
    )],
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    foregroundColor: textColor,
    leading: 
      IconButton(
        onPressed: () {
          logger.d('Person icon button pressed!');
          Navigator.pushNamed(context, '/profile');
        },
        icon: const CircleAvatar(
          backgroundImage: AssetImage('assets/Profile.png'),
        ),
      ),
    
    title: const Text(
      "Journalia",
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Caveat',
        fontWeight: FontWeight.bold,
        fontSize: 48,
      ),
    ),
  );
}


AppBar buildAppBar2(BuildContext context) {
  return AppBar(
   leading: IconButton(icon: const Icon(Icons.arrow_back,color: primaryTextColor,),onPressed: () => Navigator.pop(context)),
   title: const Text(
     "Journalia",
     style: TextStyle(
       color: Colors.black,
       fontFamily: 'Caveat',
       fontWeight: FontWeight.bold,
       fontSize: 48,
     ),
   ),
   centerTitle: true,
   backgroundColor: Colors.transparent,
    foregroundColor: textColor,
   actions: [
     Builder(
       builder: (context) {
         return IconButton(
           onPressed: () {Scaffold.of(context).openDrawer();},
           icon: const Icon(Icons.menu,color: primaryTextColor),
           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
           );
       }
     )
   ],
 );
}