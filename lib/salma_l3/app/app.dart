import 'package:flutter/material.dart';

import '../projects/get_user/view.dart';

class SalmaL3App extends StatelessWidget {
  const SalmaL3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SalmaUserProfilePageView(),
    );
  }
}
