import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page1> {
  Logger logger = Logger();
  String selectedButton = "Communities"; // Initial selected button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 50,
            top: 100,
            child: Column(
              children: [
                _buildBlock(Colors.blue),
                _buildBlock(Colors.blue),
                _buildBlock(Colors.blue),
                const SizedBox(height: 10),
                const Text(
                  "Jai\nNEET\nScam",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "OPAL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 50,
            top: 200,
            child: Column(
              children: [
                _buildBlock(Colors.green),
                _buildBlock(Colors.green),
                _buildBlock(Colors.green),
                const SizedBox(height: 10),
                const Text(
                  "Jai\nNEET\nScam",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "AQUA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 150,
            top: 400,
            child: CustomPaint(
              size: const Size(200, 100),
              painter: DottedPathPainter(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                minimumSize: const Size(200, 60), // Increased button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.transparent),
                ),
                elevation: 5,
              ),
              child: const Text(
                "Communities ▲",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20, // Increased text size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlock(Color color) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: color,
    );
  }
}

class DottedPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);

    var dashWidth = 5.0, dashSpace = 5.0, distance = 0.0;
    while (distance < path.computeMetrics().first.length) {
      canvas.drawPath(
        dashPath(path, distance, dashWidth),
        paint,
      );
      distance += dashWidth + dashSpace;
    }
  }

  Path dashPath(Path source, double start, double length) {
    var dest = Path();
    var metric = source.computeMetrics().first;
    dest.addPath(metric.extractPath(start, start + length), Offset.zero);
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
