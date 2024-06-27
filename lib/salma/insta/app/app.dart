import 'package:c3/salma/insta/screens/splash.dart';
import 'package:flutter/material.dart';

class SalmaApp extends StatelessWidget {
  const SalmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
