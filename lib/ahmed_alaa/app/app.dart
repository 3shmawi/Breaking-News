import 'package:flutter/material.dart';

import '../screens/l3/test_display_json_data.dart';

class AlaaApp extends StatelessWidget {
  const AlaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DisplayData(),
    );
  }
}
//{
// "name" :"Alaa"
// }
//map json
