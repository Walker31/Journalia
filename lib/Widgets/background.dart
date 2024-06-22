import 'package:flutter/material.dart';
import 'package:journalia/colors.dart';

const BoxDecoration appBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 24, 83, 132),
      Colors.black12,
      Colors.black12,
      secondaryColor
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
