import 'package:flutter/material.dart';

import '../views/last_session/view.dart';

class TasneimApp extends StatelessWidget {
  const TasneimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LastSession(),
    );
  }
}
