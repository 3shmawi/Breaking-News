import 'package:c3/eyad_l3/dog_img/model/dog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeDogView extends StatefulWidget {
  const HomeDogView({super.key});

  @override
  State<HomeDogView> createState() => _HomeDogViewState();
}

class _HomeDogViewState extends State<HomeDogView> {
  final dio = Dio();

  Model? data;

  @override
  void initState() {
    dio.get("https://dog.ceo/api/breeds/image/random").then((value) {
      setState(() {
        data = Model.fromJson(value.data);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Image.network(
                data!.message,
              ),
            ),
    );
  }
}
