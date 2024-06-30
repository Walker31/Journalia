import 'package:flutter/material.dart';
import 'package:journalia/Pages/Home/carousel.dart';
import 'package:journalia/Widgets/base_scaffold.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../Providers/user_provider.dart';
import '../../Widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Logger logger = Logger();
  String selectedButton = "Home"; // Initial selected button

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomHeader(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF4EED7A),
                              Color(0xFF11336D),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Text(
                            "Hey",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.italic,
                              fontSize: 36,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Consumer<UsersProvider>(
                          builder: (context, usersProvider, child) {
                            final userName =
                                usersProvider.currentUser?.userName ?? 'Guest';
                            return Text(
                              userName,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.italic,
                                fontSize: 36,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4.0),
                        ),
                        child: const Text(
                          "Streaks",
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = "Home";
                      });
                      logger.d("Home Pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedButton == "Home" ? Colors.white : Colors.grey,
                      foregroundColor:
                          selectedButton == "Home" ? Colors.black : Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = "Communities";
                      });
                      logger.d("Communities Pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == "Communities"
                          ? Colors.white
                          : Colors.grey,
                      foregroundColor: selectedButton == "Communities"
                          ? Colors.black
                          : Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Communities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Carousel()
            ],
          ),
        ),
      ),
    );
  }
}
