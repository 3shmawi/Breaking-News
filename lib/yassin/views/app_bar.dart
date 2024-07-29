import 'package:flutter/material.dart';

class YassinAppBar extends StatelessWidget {
  const YassinAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            print('hello');
          },
          icon: Icon(Icons.menu),
        ),
        leadingWidth: 20,
        title: Text("Search bar"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print('yassin');
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
