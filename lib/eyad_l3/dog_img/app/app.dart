import 'package:flutter/material.dart';

import '../view/home.dart';

class EyadApp extends StatelessWidget {
  const EyadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeDogView(),
    );
  }
}
