import 'package:flutter/material.dart';

import '../views/facebook_clone/facebook_home.dart';

class YassinApp extends StatelessWidget {
  const YassinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: FacebookHome(),
    );
  }
}
