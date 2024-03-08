import 'package:flutter/material.dart';

import '../presentations/layout/view.dart';

class SharksApp extends StatelessWidget {
  const SharksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharksLayout(),
    );
  }
}
