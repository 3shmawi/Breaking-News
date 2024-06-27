import 'package:flutter/material.dart';

import '../screens/splash.dart';

class NourApp extends StatelessWidget {
  const NourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TiktokSplashView(),
    );
  }
}
