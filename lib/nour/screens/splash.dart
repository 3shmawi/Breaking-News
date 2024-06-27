import 'package:flutter/material.dart';

import 'home.dart';

class TiktokSplashView extends StatefulWidget {
  const TiktokSplashView({super.key});

  @override
  State<TiktokSplashView> createState() => _TiktokSplashViewState();
}

class _TiktokSplashViewState extends State<TiktokSplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeNourScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/tiktok/logo.png",
              height: 100,
              width: 100,
            ),
            const Spacer(),
            Text("@copyWrite Nour"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
