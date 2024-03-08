import 'dart:math';

import 'package:flutter/material.dart';

class AdvApp extends StatelessWidget {
  const AdvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(25),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 230,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(10)),
                    border: Border.all(width: 40, color: Colors.black)),
              ),
              Positioned(
                top: -35,
                left: 10,
                child: Transform.rotate(
                  angle: 7 / pi,
                  child: Container(
                    height: 300,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HalfCircleWidget extends StatelessWidget {
  const HalfCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue // Color of the half circle
      ..style = PaintingStyle.fill;

    // Calculate the radius of the circle (half of the width)
    double radius = size.width / 2;

    // Calculate the center of the circle
    Offset center = Offset(size.width / 2, size.height);

    // Draw the half circle using an arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Start angle (180 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      true, // Use center
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
