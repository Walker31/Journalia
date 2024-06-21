import 'package:flutter/material.dart';
import 'package:journalia/Pages/Feed/feed_page.dart';
import 'package:journalia/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) => UserProvider(),
      child: MaterialApp(
    theme: ThemeData.dark(),
    home:  const FeedPage(),
    debugShowCheckedModeBanner: false,
  )
    );
  }
}