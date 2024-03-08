import 'package:flutter/material.dart';

import '../../bmi/view.dart';

class IbPaApp extends StatelessWidget {
  const IbPaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiView(),
    );
  }
}

//controller
//views
//model
