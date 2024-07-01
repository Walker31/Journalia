import 'package:flutter/material.dart';
import '../Home/home_page.dart';
import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Dummy authentication state
  final ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: isLoggedIn,
        builder: (context, value, child) {
          // User is logged in
          if (value) {
            return const HomePage(); // Show HomePage if the user is logged in
          } 
          // User is NOT logged in
          else {
            return const LoginPage(); // Show LoginPage if the user is not logged in
          }
        },
      ),
    );
  }
}
