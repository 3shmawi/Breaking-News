import 'package:flutter/material.dart';

import '../views/youtube_clone/layout/view.dart';

class TasneimApp extends StatelessWidget {
  const TasneimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YoutubeLayoutView(),
    );
  }
}
