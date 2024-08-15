import 'package:flutter/material.dart';

import '../views/app_bar.dart';

class YassinApp extends StatelessWidget {
  const YassinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: YassinAppBar(),
    );
  }
}
