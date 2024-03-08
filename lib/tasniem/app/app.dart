
//stless
import 'package:flutter/material.dart';

import '../views/instgram_bar.dart';

class TasniemApp extends StatelessWidget {
  const TasniemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstagramBar(),
    );
  }
}
