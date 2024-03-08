import 'package:flutter/material.dart';

class EgyptFlag extends StatelessWidget {
  const EgyptFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 10,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  color: Colors.white,
                  child: const Icon(
                    Icons.flutter_dash,
                    color: Colors.yellow,
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
