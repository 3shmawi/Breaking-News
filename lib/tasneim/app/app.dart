import 'package:c3/tasneim/views/calculator/view.dart';
import 'package:flutter/material.dart';

class TasneimApp extends StatelessWidget {
  const TasneimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}
