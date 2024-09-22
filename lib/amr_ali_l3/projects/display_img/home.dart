import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DisplayImgHome extends StatefulWidget {
  const DisplayImgHome({super.key});

  @override
  State<DisplayImgHome> createState() => _DisplayImgHomeState();
}

class _DisplayImgHomeState extends State<DisplayImgHome> {
  final abc = Dio();

  String? imgUrl;

  List<String> images = [];

  void getData() {
    setState(() {
      imgUrl = null;
    });
    //(patch  put)=> update
    abc.get("https://dog.ceo/api/breeds/image/random").then((response) {
      print(response.data);
      imgUrl = response.data["message"];
      images.add(imgUrl!);
      setState(() {});
    }).catchError((error) {
      print(error.toString());
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
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Image Display'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Transform.rotate(
              angle: 1.6,
              child: ListWheelScrollView(
                itemExtent: 200,
                children: List.generate(
                  images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Transform.rotate(
                        angle: -1.6,
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: imgUrl == null ? null : getData,
              child: Text('Get Random Image'),
            ),
          ),
          if (imgUrl == null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(color: Colors.cyan),
            ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
