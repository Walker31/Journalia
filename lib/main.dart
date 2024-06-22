import 'package:flutter/material.dart';
import 'package:journalia/Pages/Feed/feed_page.dart';
import 'package:journalia/Pages/Home/home_page.dart'; // Import the sample page
import 'package:journalia/Pages/Home/samle.dart';
import 'package:journalia/custom_curve.dart';
import 'package:journalia/providers/article_provider.dart';
import 'package:provider/provider.dart';

import 'Providers/topic_provider.dart';
import 'Providers/user_provider.dart';
import 'Providers/vote_provider.dart';

void main() {
  runApp(const MaterialApp(
    home: SineWaveWidget(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
        ChangeNotifierProvider(create: (_) => TopicProvider()),
        ChangeNotifierProvider(create: (_) => VotesProvider()),
        // Add more providers as needed
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home', // Specify initial route
        routes: {
          '/home': (context) => const HomePage(),
          '/feed': (context) => const FeedPage(),
          '/sample': (context) => const Page1() // Add the sample page route
          // Add more routes as needed
        },
      ),
    );
  }
}
