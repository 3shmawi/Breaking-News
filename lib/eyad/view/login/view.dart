import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: 100,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}