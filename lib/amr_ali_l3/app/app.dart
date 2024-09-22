import 'package:c3/amr_ali_l3/projects/display_img/home.dart';
import 'package:flutter/material.dart';

class AmrAliApp extends StatelessWidget {
  const AmrAliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DisplayImgHome(),
    );
  }
}
