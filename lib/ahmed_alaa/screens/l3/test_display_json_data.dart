import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Map<String, String> data = {"name": "Mohamed", "age": "30", "city": "Paris"};

//dio
class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  final _dio = Dio();

  Map<String, dynamic> comingData = {};

  void getData() {
    setState(() {
      comingData = {};
    });
    _dio.get("https://randomuser.me/api/").then((value) {
      setState(() {
        comingData = value.data;
      });
      print(value.data);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: comingData.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Statues: ${comingData["status"]}",
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage(
                          comingData["results"][0]["picture"]["large"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getData,
                    child: Text("Get Data"),
                  ),
                ],
              ),
      ),
    );
  }
}

//state management
//cubit
