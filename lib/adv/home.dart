import 'package:c3/adv/Random.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Random? usrModel;

  @override
  void initState() {
    _getImg();
    super.initState();
  }

  final _dio = Dio();

  void _getImg() {
    _dio.get('https://randomuser.me/api/').then((value) {
      setState(() {
        usrModel = Random.fromJson(value.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: usrModel == null
            ? CircularProgressIndicator()
            : Text(usrModel!.results!.first.email!),
      ),
    );
  }
}
