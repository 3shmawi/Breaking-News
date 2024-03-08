import 'package:c3/mostafa_mohamed_l3/random_img/model/dog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  void initState() {
    _fetch();
    super.initState();
  }

  DogModel? model;
  final Dio dio = Dio();

  void _fetch() {
    model = null;
    dio.get("https://dog.ceo/api/breeds/image/random").then((value) {
      model = DogModel.fromJson(value.data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: model == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  model!.message,
                  width: double.infinity,
                ),
                Text(model!.status),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    _fetch();
                  },
                  child: const Text("refresh"),
                ),
              ],
            ),
    );
  }
}
