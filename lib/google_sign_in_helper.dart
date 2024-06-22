import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:journalia/Pages/Login/login_page.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:journalia/providers/user_provider.dart'; // Ensure the correct import path

class GoogleSignInHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Logger logger = Logger();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (!context.mounted) return;
      if (googleUser != null) {
        // Handle successful sign-in
        logger.d('Google Sign-In successful. User: ${googleUser.displayName}');
        // Set user details in the provider and navigate to home
        Provider.of<UsersProvider>(context, listen: false).setUserDetails(googleUser.displayName??'',googleUser.email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      }
    } catch (error) {
      logger.e('Google Sign-In failed: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Google Sign-In failed"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
