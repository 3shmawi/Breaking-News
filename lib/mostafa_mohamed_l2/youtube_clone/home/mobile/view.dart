import 'package:c3/mostafa_mohamed_l2/youtube_clone/home/widgets.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) => const YoutubeItem(),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}