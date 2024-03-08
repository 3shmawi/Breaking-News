import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'egypt_flag.dart';

//ctrl   alt  l
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        foregroundColor: Colors.grey,
        centerTitle: false,
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            const SizedBox(
              width: 14,
            ),
            const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
            const SizedBox(
              width: 14,
            ),
            const Icon(
              Icons.refresh,
              size: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Icon(
              Icons.view_sidebar_outlined,
              size: 25,
              color: Colors.grey[400],
            ),
            const Icon(CupertinoIcons.profile_circled),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
      body: EgyptFlag(),
    );
  }
}
