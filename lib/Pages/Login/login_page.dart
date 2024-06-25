import 'package:flutter/material.dart';
import 'package:journalia/Pages/Login/register.dart';
import 'package:journalia/colors.dart';
import 'package:logger/logger.dart';
import '../../Backend/auth.dart'; // Import AuthService

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true; // Initially password is obscured

  final Logger logger = Logger();
  final AuthService authService = AuthService(); // Initialize AuthService

  void _login() async {
    try {
      final response = await authService.login(username.text, password.text);
      logger.i('Login successful: ${response.toString()}');
      // Handle successful login (e.g., navigate to another screen)
    } catch (e) {
      logger.e('Login failed: $e');
      // Show error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.8),
                  secondaryColor.withOpacity(0.8)
                ],
                stops: const [0, 1],
                begin: const AlignmentDirectional(0.87, -1),
                end: const AlignmentDirectional(-0.87, 1),
              ),
            ),
            alignment: const AlignmentDirectional(0, -1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: primaryBackgroundColor.withOpacity(0.85),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/NITT.png', // Replace with your image asset path
                                height: 150, // Adjust height as needed
                                width: 150, // Adjust width as needed
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: primaryTextColor,
                                ),
                              ),
                              const SizedBox(height: 40), // Increase spacing
                              TextField(
                                controller: username,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      secondaryBackgroundColor.withOpacity(0.9),
                                  hintText: "UserName.",
                                  prefixIcon: const Icon(Icons.person,
                                      color: secondaryColor), // Add icon
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: password,
                                obscureText: obscurePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      secondaryBackgroundColor.withOpacity(0.9),
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.lock,
                                      color: secondaryColor), // Add icon
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: secondaryColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: secondaryTextColor),
                                  ),
                                  GestureDetector(
                                    child: const Text(
                                      'Register here.',
                                      style: TextStyle(
                                          fontSize: 16, color: secondaryColor),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      secondaryColor, // Set button background color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 15), // Set button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ), // Set button shape
                                ),
                                onPressed: _login, // Call the _login function
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
