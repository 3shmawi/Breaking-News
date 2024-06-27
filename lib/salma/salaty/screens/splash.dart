import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
