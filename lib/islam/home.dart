import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: const Text("WhatsApp"),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.camera_alt),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
