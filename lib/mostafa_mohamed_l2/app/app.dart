import 'package:flutter/material.dart';

import '../messanger/view.dart';

class MostafaL2App extends StatelessWidget {
  const MostafaL2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black87,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.light(
            primary: Colors.blue,
          )),
      home: MessengerScreen(),
    );
  }
}
