import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:journalia/Pages/Login/login_page.dart';
import 'package:journalia/user_details.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class GoogleSignInHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Logger logger = Logger();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Handle successful sign-in
        logger.d('Google Sign-In successful. User: ${googleUser.displayName}');
        // Set user details in the provider and navigate to home
        Provider.of<UserProvider>(context, listen: false).setUserDetails(
          googleUser.displayName ?? '',
          '',
        );
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
