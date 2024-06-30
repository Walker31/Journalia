import 'package:flutter/material.dart';
import 'package:journalia/Pages/Feed/feed_page.dart';
import 'package:journalia/Pages/Feed/new_post.dart';
import 'package:journalia/Pages/Home/home_page.dart'; // Import the sample page
import 'package:journalia/Pages/Login/auth_page.dart';
import 'package:journalia/providers/article_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/Profile/profile.dart';
import 'Providers/topic_provider.dart';
import 'Providers/user_provider.dart';
import 'Providers/vote_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home', // Specify initial route
        routes: {
          '/login': (context) => const AuthPage(),
          '/home': (context) => const HomePage(),
          '/feed': (context) => const FeedPage(),
          '/createpost':(context) => const CreatePostPage(),
          '/profile':(context) => const Profile(),
          // Add more routes as needed
        },
      ),
    );
  }
}
