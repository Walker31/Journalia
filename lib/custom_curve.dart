import 'dart:math';
import 'package:flutter/material.dart'; // Corrected import

class InfiniteSineCurvePage extends StatefulWidget {
  const InfiniteSineCurvePage({super.key});

  @override
  State<InfiniteSineCurvePage> createState() => _InfiniteSineCurvePageState();
}

class _InfiniteSineCurvePageState extends State<InfiniteSineCurvePage> {
  final _scrollController = ScrollController();
  double _currentOffset = 0.0;
  final List<double> _offsets = [0.0]; // List to store offsets for each segment

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      // Load more data (update _currentOffset and add to _offsets)
      setState(() {
        _currentOffset += 200; // Adjust increment as needed
        _offsets.add(_currentOffset);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Sine Curve'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          for (final offset in _offsets) // Efficiently iterate over offsets
            SliverPersistentHeader(
              delegate: _SineCurveHeader(offset: offset),
              pinned: true,
            ),
        ],
      ),
    );
  }
}

class _SineCurveHeader extends SliverPersistentHeaderDelegate {
  final double offset;

  const _SineCurveHeader({required this.offset});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 200,
      child: CustomPaint(
        painter: SineCurvePainter(
          amplitude: 50,
          frequency: 1,
          phase: offset,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SineCurvePainter extends CustomPainter {
  final double amplitude;
  final double frequency;
  final double phase;

  SineCurvePainter({this.amplitude = 50, this.frequency = 1, this.phase = 0});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var path = Path();

    // Calculate points for sine wave
    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 - amplitude * sin((x / size.width * 2 * pi * frequency) + phase);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Draw path for sine wave
    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
