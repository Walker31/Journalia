import 'dart:math';
import 'package:flutter/material.dart';

class SineWavePainter extends CustomPainter {
  final double amplitude;
  final double wavelength;
  final double phase;
  final double dashWidth;
  final double dashSpace;

  SineWavePainter({
    this.amplitude = 50,
    this.wavelength = 100,
    this.phase = 0,
    this.dashWidth = 5,
    this.dashSpace = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Calculate number of dashes needed
    final numDashes = (size.width / (dashWidth + dashSpace)).ceil();

    final path = Path();

    // Starting point for the path
    path.moveTo(0, size.height / 2);

    // Draw the sine wave for one period with dashes
    for (int i = 0; i < numDashes; i++) {
      double x = i * (dashWidth + dashSpace);
      if (x > size.width) break; // Stop drawing if exceeds width

      final y = size.height / 2 + amplitude * sin((x / wavelength) * 2 * pi + phase);
      path.lineTo(x, y);
    }

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SineWaveWidget extends StatelessWidget {
  const SineWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Period of Sine Wave with Dashed Line'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 200),
          painter: SineWavePainter(
            amplitude: 50,
            wavelength: MediaQuery.of(context).size.width, // Adjust wavelength to fit one period
            phase: 0,
            dashWidth: 5,
            dashSpace: 5,
          ),
        ),
      ),
    );
  }
}
