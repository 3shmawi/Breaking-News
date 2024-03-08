import 'package:c3/bashar/session2.dart';
import 'package:flutter/material.dart';

import '../bmi/view.dart';
import 'bmi/view.dart';

class BasharApp extends StatelessWidget {
  const BasharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalcView(),
    );
  }
}
