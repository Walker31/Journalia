import 'package:flutter/material.dart';
import 'package:journalia/Widgets/base_scaffold.dart';
import '../Feed/new_post.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          PostHeader(),
          const SizedBox(height: 25,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 300,
                width: 300,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.all(16),
              child: const Column(),
            ),
            Column(
              children: [
                Image.asset('assets/Profile.png'),
                const Text("BMun",style: TextStyle(color: Colors.black),)
              ],
            ),
            ]
          )
        ]
        

      )
    );
  }
  
}