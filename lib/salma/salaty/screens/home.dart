import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/instagram/insta.png",
          height: 80,
        ),
      ),
    );
  }
}
//void main  >> run app >> material app  >> scaffold
