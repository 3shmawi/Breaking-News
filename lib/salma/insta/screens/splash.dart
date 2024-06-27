import 'package:c3/salma/insta/screens/home.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InstaHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/instagram/insta.png",
              height: 100,
            ),
            Spacer(),
            Text(
              "from",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
              ),
            ),
            Image.asset(
              "assets/instagram/meta.png",
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
